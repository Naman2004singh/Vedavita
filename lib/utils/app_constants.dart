import 'package:flutter/material.dart';

class AppConstants {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static const double mainPadding = 20.0;
  static const double padding10 = 10.0;
  static const double padding30 = 30.0;
  static const double sizedBox10 = 10.0;
  static const double textFieldBorder = 15.0;
  static const double loginScreen80 = 80.0;
  static const double registerScreen40 = 40.0;
}
