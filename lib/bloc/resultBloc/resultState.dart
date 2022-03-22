part of "resultBloc.dart";

abstract class ResultState extends Equatable {}

class InitialResultState extends ResultState {
  InitialResultState();
  @override
  List<Object?> get props => [];
}

class GetResultState extends ResultState {
  final String selectedDate;
  final List<QuestionsModel> questions;
  GetResultState({required this.selectedDate, required this.questions});
  @override
  List<Object?> get props => [selectedDate, questions];
}
