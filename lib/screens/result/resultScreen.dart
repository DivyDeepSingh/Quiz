import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/screens/result/resultWidget.dart';

import '../../utils/colors.dart';

class ResultScreen extends StatelessWidget {
  List<QuestionsModel> question;
  ResultScreen({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResultWidget(
      question: question,
    ));
  }
}
