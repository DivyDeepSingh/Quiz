import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/bloc/questionBloc/questionBloc.dart';
import 'package:quiz_app/bloc/resultBloc/resultBloc.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/hive/resultModel.dart';
import 'package:quiz_app/repository/resultRepository.dart';
import 'package:quiz_app/response/questions.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..initFlutter()
    ..registerAdapter(ResultModelAdapter())
    ..registerAdapter(QuestionsModelAdapter());
  group("QuestionBloc", () {
    QuestionBloc questionBloc = QuestionBloc();
    DateTime now = DateTime.now();

    setUp(() {
      questionBloc = QuestionBloc();
      now = DateTime.now();
    });

    tearDown(() {
      questionBloc.close();
    });

    test("Questions has been inserted successfully and quiz has been started",
        () async {
      List<QuestionsModel> questions = List.generate(
          Questions().questionsList.length,
          (index) => QuestionsModel.fromJson(Questions().questionsList[index]));

      bool inserted = await ResultRepository().insertResult(
          currentIndex: 0,
          date: DateTime(now.year, now.month, now.day),
          questionList: questions..shuffle());
      expect(inserted, true);
    });

    test("Questions has been updated successfully", () async {
      bool insertedList = await ResultRepository().updateQuestionList(
          currentIndex: 1, date: DateTime(now.year, now.month, now.day));

      expect(insertedList, true);
    });
  });
  group("ResultBloc", () {
    ResultBloc resultBloc = ResultBloc();
    DateTime now = DateTime.now();

    setUp(() {
      resultBloc = ResultBloc();
      now = DateTime.now();
    });

    tearDown(() {
      resultBloc.close();
    });

    test("Current state of result", () async {
      expect(resultBloc.state, InitialResultState());
    });

    test("You havent completed your quiz today", () async {
      var questions = await ResultRepository()
          .getResult(DateTime(now.year, now.month, now.day));

      expect(questions, null);
    });
  });
}
