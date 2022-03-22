import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/bloc/questionBloc/questionBloc.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/utils/colors.dart';

class Options extends StatelessWidget {
  QuestionsModel question;
  Options({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Coming");
    return Container(
      height: ScreenUtil().setHeight(100),
      width: double.infinity,
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(100),
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              width: 2.0,
              color: ThemeProvider().isLightMode
                  ? QuizColors().black38
                  : QuizColors().white38),
          bottom: BorderSide(
              width: 2.0,
              color: ThemeProvider().isLightMode
                  ? QuizColors().black38
                  : QuizColors().white38),
        ),
        color: ThemeProvider().isLightMode
            ? QuizColors().white
            : QuizColors().black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: ThemeProvider().isLightMode
                  ? QuizColors().textBlack
                  : QuizColors().textWhite,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  activeColor: Colors.green,
                  value: question.optionYesValue,
                  groupValue: question.isSelectedAnswer,
                  onChanged: (value) {
                    BlocProvider.of<QuestionBloc>(context).add(
                        SelectAnswerEvent(isAnswer: question.optionYesValue));
                  },
                ),
                Text(
                  "Yes",
                  style: TextStyle(
                      color: ThemeProvider().isLightMode
                          ? QuizColors().textBlack
                          : QuizColors().textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: ThemeProvider().isLightMode
                  ? QuizColors().textBlack
                  : QuizColors().textWhite,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  activeColor: Colors.green,
                  value: question.optionNoValue,
                  groupValue: question.isSelectedAnswer,
                  onChanged: (value) {
                    BlocProvider.of<QuestionBloc>(context).add(
                        SelectAnswerEvent(isAnswer: question.optionNoValue));
                  },
                ),
                Text(
                  "No",
                  style: TextStyle(
                      color: ThemeProvider().isLightMode
                          ? QuizColors().textBlack
                          : QuizColors().textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
