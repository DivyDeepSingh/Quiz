import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/bloc/questionBloc/questionBloc.dart';
import 'package:quiz_app/bloc/themeMode/themeModeBloc.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/screens/quiz/QuizButtons.dart';
import 'package:quiz_app/screens/quiz/options.dart';
import 'package:quiz_app/screens/quiz/questionCard.dart';
import 'package:quiz_app/screens/quiz/switch.dart';
import 'package:quiz_app/utils/colors.dart';

import '../../hive/questionModelHive.dart';

class StartQuiz extends StatelessWidget {
  QuestionsModel question;
  int count;
  StartQuiz({Key? key, required this.question, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          // color: Colors.cyan,÷
          child: Stack(
            children: [
              Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter:
                        new ColorFilter.mode(Colors.black, BlendMode.dstATop),
                    fit: BoxFit.fill,
                    image: AssetImage(ThemeProvider().isLightMode
                        ? "assets/images/whiteBg.jpeg"
                        : "assets/images/blackBg.png") as ImageProvider,
                  ),
                ),
              ),
              Container(
                  height: ScreenUtil().setHeight(200),
                  width: ScreenUtil().screenWidth,
                  color: ThemeProvider().isLightMode
                      ? QuizColors().white38
                      : QuizColors().black38,
                  child: Image.asset(
                    ThemeProvider().isLightMode
                        ? "assets/images/images.png"
                        : "assets/images/blackBgNew.png"
                    // color: Colors.black.withOpacity(0.4)
                    ,
                    fit: BoxFit.fill,
                  )),
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(120),
                    ),
                    // height: 100,
                    child: QuestionCard(
                        question: question.question!, count: count),
                  ),
                  Options(
                    question: question,
                  ),
                  QuizButtons(confirmOnTap: () {
                    print("Hereeeeeeeee");
                    if (question.isSelectedAnswer == null) {
                      //Do something, show message
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please seleect an option'),
                        duration: Duration(seconds: 1),
                      ));
                    } else {
                      print("onTapp");

                      BlocProvider.of<QuestionBloc>(context).add(CheckAnswer());
                    }
                  })
                ],
              ),
              Positioned(
                top: ScreenUtil().setHeight(20),
                right: 10,
                left: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        child: Text(
                          'Previous Result',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: !ThemeProvider().isLightMode
                                ? QuizColors().black38
                                : QuizColors().white,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(context, "resultScreen");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: ThemeProvider().isLightMode
                              ? QuizColors().black
                              : QuizColors().white,

                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        ),
                      ),
                    ),
                    Expanded(child: CustomSwitch()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
