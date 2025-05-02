import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vedavita/utils/app_textstyle.dart';

TextSpan privacySpan() {
  return const TextSpan(
      text: 'By signing up, agree to our',
      style: AppTextstyle.headingSmallW,
      children: <TextSpan>[
        TextSpan(text: ' Terms & Conditions', style: AppTextstyle.bodyMediumB),
        TextSpan(text: ' and ', style: AppTextstyle.headingSmallW),
        TextSpan(text: 'Privacy Policy', style: AppTextstyle.bodyMediumB)
      ]);
}

Text orData() {
  return const Text(
    '____________ Or ____________',
    style: AppTextstyle.headingSmallW,
    textAlign: TextAlign.center,
  );
}

TextSpan haveAccount(final VoidCallback ontap) {
  return TextSpan(
      text: 'Already have an account?    ',
      style: AppTextstyle.headingSmallW,
      children: [
        TextSpan(
            text: 'Sign In',
            style: AppTextstyle.bodyMedUnderlineB,
            recognizer: TapGestureRecognizer()..onTap = ontap)
      ]);
}

TextSpan notHaveAccount(final VoidCallback ontap) {
  return TextSpan(
      text: "Don't have an account?    ",
      style: AppTextstyle.headingSmallW,
      children: [
        TextSpan(
            text: 'Sign Up',
            style: AppTextstyle.bodyMedUnderlineB,
            recognizer: TapGestureRecognizer()..onTap = ontap)
      ]);
}
