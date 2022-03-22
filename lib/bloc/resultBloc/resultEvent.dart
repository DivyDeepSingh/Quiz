part of "resultBloc.dart";

abstract class ResultEvent extends Equatable {}

class ShowResultEvent extends ResultEvent {
  DateTime date;
  ShowResultEvent({required this.date});
  @override
  List<Object?> get props => [date];
}

class SetResultEvent extends ResultEvent {
  SetResultEvent();
  @override
  List<Object?> get props => [];
}
