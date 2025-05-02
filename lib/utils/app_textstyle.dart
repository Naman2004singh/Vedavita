import 'package:flutter/material.dart';
import 'package:vedavita/utils/app_colors.dart';

class AppTextstyle {
  static const TextStyle headingLargeW = TextStyle(
      fontFamily: " Manrope",
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor);
  static const TextStyle headingMediumW = TextStyle(
      fontFamily: " Manrope",
      fontSize: 21.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor);
  static const TextStyle headingSmallW = TextStyle(
      fontFamily: " Manrope",
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor);
  static const TextStyle headingSmall = TextStyle(
      fontFamily: " Manrope",
      fontSize: 18.0,
      fontWeight: FontWeight.w600, //more fontWeight
      color: AppColors.whiteColor);
  static const TextStyle bodyLargeB = TextStyle(
      fontFamily: " Manrope",
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor);
  static const TextStyle bodyMedUnderlineB = TextStyle(
      fontFamily: " Manrope",
      fontSize: 17.0,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor);
  static const TextStyle bodyMediumB = TextStyle(
      fontFamily: " Manrope",
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);
  static const TextStyle bodySmallB = TextStyle(
      fontFamily: " Manrope",
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
}
