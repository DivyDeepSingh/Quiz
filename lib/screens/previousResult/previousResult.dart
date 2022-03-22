import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/resultBloc/resultBloc.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/screens/result/resultScreen.dart';
import 'package:quiz_app/utils/colors.dart';

class PreviousResult extends StatelessWidget {
  PreviousResult({Key? key}) : super(key: key);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      //hit your bloc event
      print(picked);
      BlocProvider.of<ResultBloc>(context).add(ShowResultEvent(date: picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Result"),
        ),
        body: BlocBuilder<ResultBloc, ResultState>(
          builder: (context, state) {
            print(state);
            if (state is InitialResultState) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _selectDate(context),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Date",
                              style: TextStyle(
                                  color: ThemeProvider().isLightMode
                                      ? QuizColors().textBlack
                                      : QuizColors().textWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.date_range,
                              color: ThemeProvider().isLightMode
                                  ? QuizColors().textBlack
                                  : QuizColors().textWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is GetResultState) {
              return Container(
                // padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _selectDate(context),
                      child: Container(
                        // padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: const ColorFilter.mode(
                                Colors.black, BlendMode.dstATop),
                            fit: BoxFit.fill,
                            image: AssetImage(ThemeProvider().isLightMode
                                ? "assets/images/whiteBg.jpeg"
                                : "assets/images/blackBg.png"),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.selectedDate,
                                style: TextStyle(
                                    color: ThemeProvider().isLightMode
                                        ? QuizColors().textBlack
                                        : QuizColors().textWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.date_range,
                                color: ThemeProvider().isLightMode
                                    ? QuizColors().textBlack
                                    : QuizColors().textWhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    state.questions.isEmpty
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No data found for this date",
                                  style: TextStyle(
                                      color: ThemeProvider().isLightMode
                                          ? QuizColors().textBlack
                                          : QuizColors().textWhite,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: ResultScreen(question: state.questions)),
                  ],
                ),
              );
            }
            throw "bad state";
          },
        ));
  }
}
