import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/bloc/questionBloc/questionBloc.dart';
import 'package:quiz_app/bloc/resultBloc/resultBloc.dart';
import 'package:quiz_app/bloc/themeMode/themeModeBloc.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/hive/resultModel.dart';
import 'package:quiz_app/quizApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..initFlutter()
    ..registerAdapter(ResultModelAdapter())
    ..registerAdapter(QuestionsModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 690),
        builder: () => MultiBlocProvider(providers: [
              BlocProvider(
                create: (BuildContext context) => ThemeModeBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => QuestionBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => ResultBloc(),
              )
            ], child: const QuizApp()));
  }
}
