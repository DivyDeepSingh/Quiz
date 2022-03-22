part of "questionBloc.dart";

abstract class QuestionBlocEvent extends Equatable {}

class InitialQuestionEvent extends QuestionBlocEvent {
  InitialQuestionEvent();
  @override
  List<Object?> get props => [];
}

class NextQuestionEvent extends QuestionBlocEvent {
  NextQuestionEvent();
  @override
  List<Object?> get props => [];
}

class CheckAnswer extends QuestionBlocEvent {
  CheckAnswer();
  @override
  List<Object?> get props => [];
}

class SkipQuestionEvent extends QuestionBlocEvent {
  SkipQuestionEvent();
  @override
  List<Object?> get props => [];
}

class SelectAnswerEvent extends QuestionBlocEvent {
  final int isAnswer;
  SelectAnswerEvent({required this.isAnswer});
  @override
  List<Object?> get props => [isAnswer];
}
