import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/utils/colors.dart';

class ResultWidget extends StatelessWidget {
  List<QuestionsModel> question;
  ResultWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.dstATop),
          fit: BoxFit.fill,
          image: AssetImage(ThemeProvider().isLightMode
              ? "assets/images/whiteBg.jpeg"
              : "assets/images/blackBg.png"),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: ScrollPhysics(),
        itemCount: question.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 40, right: 10, left: 10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: ThemeProvider().isLightMode
                        ? QuizColors().textBlack
                        : QuizColors().textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question[index].question!,
                    style: TextStyle(
                        color: ThemeProvider().isLightMode
                            ? QuizColors().textBlack
                            : QuizColors().textWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        question[index].isSelectedAnswer == null
                            ? "Not Answered"
                            : question[index].isSelectedAnswer == 1
                                ? "Yes"
                                : "No",
                        style: TextStyle(
                            color: ThemeProvider().isLightMode
                                ? QuizColors().textBlack
                                : QuizColors().textWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      question[index].isSelectedAnswer == null
                          ? Icon(
                              Icons.restore,
                              color: Colors.green,
                            )
                          : question[index].correctAnswer ==
                                  question[index].isSelectedAnswer
                              ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                    ],
                  )
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
