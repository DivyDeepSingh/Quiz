import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/themeMode/themeModeBloc.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/utils/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            "Switch to ${!ThemeProvider().isLightMode ? "light" : "dark"} mode",
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 14,
                color: ThemeProvider().isLightMode
                    ? QuizColors().black
                    : QuizColors().textWhite,
                fontWeight: FontWeight.w900),
          ),
        ),
        Switch(
            activeTrackColor: ThemeProvider().isLightMode
                ? QuizColors().white38
                : QuizColors().black38,
            activeColor: QuizColors().black38,
            inactiveThumbColor: QuizColors().yellow,
            inactiveTrackColor: ThemeProvider().isLightMode
                ? QuizColors().black38
                : QuizColors().white38,
            value: ThemeProvider().isLightMode,
            onChanged: (bool value) async {
              BlocProvider.of<ThemeModeBloc>(context).add(SetThemeModeEvent());
            }),
      ],
    );
  }
}
