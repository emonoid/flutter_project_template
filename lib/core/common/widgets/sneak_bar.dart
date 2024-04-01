import 'package:flutter/material.dart';

import '../../theme/color.pallete.dart';
import 'qtec_text.dart';

class QtecSneakBar {
  static void customSnackBar(
      {required context,
      required String snackText,
      SnackBarBehavior? snackBehavior,
      SnackBarAction? snackBarAction,
      double? snackTextSize,
      Color? snackTextColor,
      int? snackDuration,
      Color? snackBackgroundColor}) {
    final snack = SnackBar(
      backgroundColor: snackBackgroundColor ?? ColorPallete.blackColor,
      behavior: snackBehavior ?? SnackBarBehavior.fixed,
      elevation: 0,
      action: snackBarAction,
      content: QtecTextWidget(
          color: snackTextColor ?? ColorPallete.whiteColor,
          fontSize: snackTextSize ?? 14,
          maxLines: 4,
          text: snackText),
      duration: Duration(seconds: snackDuration ?? 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
