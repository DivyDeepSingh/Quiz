import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/bloc/themeMode/themeModeBloc.dart';
import 'package:quiz_app/screens/quiz/manageQuiz.dart';
import 'package:quiz_app/screens/result/resultScreen.dart';
import 'package:quiz_app/screens/quiz/startQuiz.dart';
import 'package:quiz_app/utils/themes.dart';

import 'screens/previousResult/previousResult.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (BuildContext context, ThemeModeState state) {
        if (state is InitialThemeModeState) {
          BlocProvider.of<ThemeModeBloc>(context).add(InitialThemeModeEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetThemeModeState) {
          return MaterialApp(
            builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            debugShowCheckedModeBanner: false,
            title: 'Quiz',
            theme: QuizTheme().lightTheme,
            darkTheme: QuizTheme().darkTheme,
            themeMode: state.isLightMode ? ThemeMode.light : ThemeMode.dark,
            // debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // ignore: prefer_const_constructors
              '/': (context) => ManageQuiz(),
              'resultScreen': (context) => PreviousResult(),
            },
          );
        }

        throw "bad state";
      },
    );
  }
}
