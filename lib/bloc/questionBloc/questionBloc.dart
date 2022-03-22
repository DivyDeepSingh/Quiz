import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/repository/resultRepository.dart';
import 'package:quiz_app/response/questions.dart';
import '../../hive/questionModelHive.dart';
part 'questionBlocState.dart';
part 'questionBlocEvent.dart';

class QuestionBloc extends Bloc<QuestionBlocEvent, QuestionBlocState> {
  bool isLightMode = true;

  List<QuestionsModel> shuffeledList = [];
  int questionNumber = 0;
  QuestionBloc() : super(InitialQuestionState()) {
    on<InitialQuestionEvent>((event, emit) async {
      DateTime now = DateTime.now();

      var isExist = await ResultRepository()
          .checkIfDateExist(date: DateTime(now.year, now.month, now.day));

      if (isExist == null) {
        List<QuestionsModel> questions = List.generate(
            Questions().questionsList.length,
            (index) =>
                QuestionsModel.fromJson(Questions().questionsList[index]));
        shuffeledList = questions..shuffle();
        await ResultRepository().insertResult(
            currentIndex: questionNumber,
            date: DateTime(now.year, now.month, now.day),
            questionList: shuffeledList);
        emit(GetQuestionState(
            question: shuffeledList[questionNumber],
            questionCount: questionNumber + 1));
      } else if (isExist.isQuizComplected) {
        shuffeledList = isExist.shuffeledList;
        emit(ResultState(question: shuffeledList));
      } else {
        print(isExist);
        shuffeledList = isExist.shuffeledList;
        questionNumber = isExist.currentIndex;
        print(questionNumber);
        emit(GetQuestionState(
            question: shuffeledList[questionNumber],
            questionCount: questionNumber + 1));
      }
    });

    on<CheckAnswer>((event, emit) async {
//Show pop up based on answer
      emit(NullState());
      emit(GetQuestionState(
          question: shuffeledList[questionNumber],
          questionCount: questionNumber + 1,
          isAnswerCorrect: shuffeledList[questionNumber].correctAnswer ==
              shuffeledList[questionNumber].isSelectedAnswer));
    });
    on<NextQuestionEvent>((event, emit) async {
//To move towards the next question

      DateTime now = DateTime.now();
      if (questionNumber + 1 < Questions().questionsList.length) {
        questionNumber += 1;

        await ResultRepository().updateQuestionList(
            currentIndex: questionNumber,
            date: DateTime(now.year, now.month, now.day));
        emit(GetQuestionState(
            question: shuffeledList[questionNumber],
            questionCount: questionNumber + 1));
      } else {
        //Emit quiz complete state
        await ResultRepository()
            .endQuiz(date: DateTime(now.year, now.month, now.day));
        emit(ResultState(question: shuffeledList));
      }
    });
    on<SkipQuestionEvent>((event, emit) async {
      shuffeledList[questionNumber].isSelectedAnswer = null;
      DateTime now = DateTime.now();
      if (questionNumber + 1 < Questions().questionsList.length) {
        questionNumber += 1;
        await ResultRepository().updateQuestionList(
            currentIndex: questionNumber,
            date: DateTime(now.year, now.month, now.day));
        emit(GetQuestionState(
            question: shuffeledList[questionNumber],
            questionCount: questionNumber + 1));
      } else {
        //Emit quiz complete state
        await ResultRepository()
            .endQuiz(date: DateTime(now.year, now.month, now.day));
        emit(ResultState(question: shuffeledList));
      }
    });
    on<SelectAnswerEvent>((event, emit) async {
      shuffeledList[questionNumber].isSelectedAnswer = event.isAnswer;
      emit(NullState());
      emit(GetQuestionState(
          question: shuffeledList[questionNumber],
          questionCount: questionNumber + 1));
    });
  }
}
