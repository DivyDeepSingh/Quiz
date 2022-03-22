import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/providers/themeProvider.dart';
import 'package:quiz_app/utils/colors.dart';

class Common {
  bool isDarkMode() {
    return !ThemeProvider().isLightMode;
  }

  bool isPortrait({required BuildContext context}) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  Widget popUpForCorrectAnswer(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          ThemeProvider().isLightMode ? QuizColors().white : QuizColors().black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/thumbUpImageTwo.png",
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setHeight(200),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Great Lets move to the next question",
                    style: TextStyle(
                        color: ThemeProvider().isLightMode
                            ? QuizColors().black
                            : QuizColors().white,
                        fontSize: 16),
                  ),
                ],
              ),
              Positioned(
                  top: 0,
                  right: 4,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: !ThemeProvider().isLightMode
                          ? QuizColors().white
                          : QuizColors().black,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget popUpForInCorrectAnswer(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          ThemeProvider().isLightMode ? QuizColors().white : QuizColors().black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Column(
                children: [
                  Transform.rotate(
                    angle: 60,
                    child: Image.asset(
                      "assets/images/thumbUpImageTwo.png",
                      width: ScreenUtil().setWidth(200),
                      height: ScreenUtil().setHeight(200),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Wrong answer, Take care next time",
                    style: TextStyle(
                        color: ThemeProvider().isLightMode
                            ? QuizColors().black
                            : QuizColors().white,
                        fontSize: 16),
                  ),
                ],
              ),
              Positioned(
                  top: 0,
                  right: 4,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: !ThemeProvider().isLightMode
                          ? QuizColors().white
                          : QuizColors().black,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
