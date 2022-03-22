import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/questionBloc/questionBloc.dart';
import 'package:quiz_app/screens/result/resultScreen.dart';
import 'package:quiz_app/screens/quiz/startQuiz.dart';
import 'package:quiz_app/widgets/common.dart';

class ManageQuiz extends StatelessWidget {
  const ManageQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionBloc, QuestionBlocState>(
        listener: (context, state) async {
      if (state is GetQuestionState) {
        print("Hereeeee" + state.isAnswerCorrect.toString());
        if (state.isAnswerCorrect != null) {
          if (state.isAnswerCorrect!) {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Common().popUpForCorrectAnswer(context);
                });
            print("correct");
            BlocProvider.of<QuestionBloc>(context).add(NextQuestionEvent());
          } else {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Common().popUpForInCorrectAnswer(context);
                });
            BlocProvider.of<QuestionBloc>(context).add(NextQuestionEvent());
            // print("Call the next question");
          }
        }
      }
    }, child: BlocBuilder<QuestionBloc, QuestionBlocState>(
      builder: (context, state) {
        print(state);
        if (state is InitialQuestionState) {
          BlocProvider.of<QuestionBloc>(context).add(InitialQuestionEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetQuestionState) {
          return StartQuiz(
              question: state.question, count: state.questionCount);
        }
        if (state is ResultState) {
          return ResultScreen(
            question: state.question,
          );
        }
        throw "bad state";
      },
    ));
  }
}
