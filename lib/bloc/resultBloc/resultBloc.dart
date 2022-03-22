import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/repository/resultRepository.dart';
part 'resultState.dart';
part 'resultEvent.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  bool isLightMode = true;
  ResultBloc() : super(InitialResultState()) {
    on<ShowResultEvent>((event, emit) async {
      String selectedDate = DateFormat('EEE, M/d/y')
          .format(DateTime(event.date.year, event.date.month, event.date.day))
          .toString();

      print(selectedDate);
      var questions = await ResultRepository().getResult(
          DateTime(event.date.year, event.date.month, event.date.day));

      // if (questions == null) {
      //   emit(InitialResultState());
      // } else {
      emit(GetResultState(
          selectedDate: selectedDate, questions: questions ?? []));
      // }

      return;
    });
  }
}
