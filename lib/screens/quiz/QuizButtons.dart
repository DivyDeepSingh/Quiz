import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/bloc/questionBloc/questionBloc.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/utils/colors.dart';

class QuizButtons extends StatelessWidget {
  final Function confirmOnTap;
  QuizButtons({Key? key, required this.confirmOnTap}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(100),
          right: ScreenUtil().setWidth(10),
          left: ScreenUtil().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ThemeProvider().isLightMode
                      ? QuizColors().black38
                      : QuizColors().white,
                ),
              ),
              onPressed: () => confirmOnTap(),
              style: ElevatedButton.styleFrom(
                primary: ThemeProvider().isLightMode
                    ? QuizColors().white
                    : QuizColors().black,
              )),
          ElevatedButton(
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeProvider().isLightMode
                    ? QuizColors().black38
                    : QuizColors().white,
              ),
            ),
            onPressed: () async {
              BlocProvider.of<QuestionBloc>(context).add(SkipQuestionEvent());
            },
            style: ElevatedButton.styleFrom(
              primary: ThemeProvider().isLightMode
                  ? QuizColors().white
                  : QuizColors().black,

              // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
          ),
        ],
      ),
    );
  }
}
