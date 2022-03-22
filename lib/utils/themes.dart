import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class QuizTheme {
  ThemeData get lightTheme => ThemeData(
      backgroundColor: QuizColors().white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: QuizColors().black,
        ),
        color: QuizColors().white,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: QuizColors().black),
      ),
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        iconColor: QuizColors().black,
        border: InputBorder.none,
      )
      //scaffoldBackgroundColor: QuizColors().white
      );
  ThemeData get darkTheme => ThemeData(
        backgroundColor: QuizColors().black,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: QuizColors().textWhite,
            ),
            color: QuizColors().black38,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: QuizColors().textWhite,
            ),
            centerTitle: true),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: QuizColors().white38,
          border: InputBorder.none,
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: QuizColors().black38,
      );
}
