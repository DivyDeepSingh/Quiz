import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/utils/colors.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final int count;
  const QuestionCard({Key? key, required this.question, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: ThemeProvider().isLightMode
                  ? QuizColors().black
                  : QuizColors().white,
              offset: Offset(2.0, 2.0),
              // spreadRadius: 2.0,
              blurRadius: 20.0),
        ],
        border: Border.all(
            width: 2.0,
            color: ThemeProvider().isLightMode
                ? Colors.transparent
                : QuizColors().white38),
        color: ThemeProvider().isLightMode
            ? QuizColors().white
            : QuizColors().black,
      ),
      constraints: BoxConstraints(
        minHeight: ScreenUtil().setHeight(100),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "$count/20",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: ThemeProvider().isLightMode
                          ? QuizColors().textBlack
                          : QuizColors().textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  DateFormat('EEE, M/d/y').format(DateTime.now()).toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: ThemeProvider().isLightMode
                          ? QuizColors().textBlack
                          : QuizColors().textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            question,
            style: TextStyle(
                color: ThemeProvider().isLightMode
                    ? QuizColors().textBlack
                    : QuizColors().textWhite,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
