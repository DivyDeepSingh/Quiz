part of "questionBloc.dart";

abstract class QuestionBlocState extends Equatable {}

class InitialQuestionState extends QuestionBlocState {
  InitialQuestionState();
  @override
  List<Object?> get props => [];
}

class GetQuestionState extends QuestionBlocState {
  QuestionsModel question;
  int questionCount;
  bool? isAnswerCorrect;
  GetQuestionState(
      {required this.question,
      required this.questionCount,
      this.isAnswerCorrect});
  @override
  List<Object?> get props => [question, questionCount];
}

class NullState extends QuestionBlocState {
  NullState();
  @override
  List<Object?> get props => [];
}

class ResultState extends QuestionBlocState {
  List<QuestionsModel> question;
  ResultState({required this.question});
  @override
  List<Object?> get props => [question];
}
