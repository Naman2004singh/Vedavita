import 'package:flutter/material.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class AppInputDecoration {
  static InputDecoration textFieldDecoration(
      {required String labelText,
      String? hintText,
      IconData? prefixicon,
      IconData? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: AppTextstyle.bodyLargeB,
      hintStyle: AppTextstyle.headingSmall,
      prefixIcon: prefixicon != null
          ? Icon(
              prefixicon,
              size: 30.0,
              color: AppColors.blackColor,
            )
          : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.textFieldBorder),
        borderSide: const BorderSide(color: AppColors.whiteColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.textFieldBorder),
        borderSide: const BorderSide(color: AppColors.whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.textFieldBorder),
        borderSide: const BorderSide(color: AppColors.greyColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.textFieldBorder),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
    );
  }
}
