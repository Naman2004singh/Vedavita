import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar_route.dart';

class FlushBarHelper {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.all(15.0),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(20.0),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 10.0,
          icon: const Icon(
            Icons.error,
            size: 28.0,
            color: Colors.white,
          ),
          // flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.all(15.0),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(20.0),
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 10.0,
          icon: const Icon(
            Icons.check_circle,
            size: 28.0,
            color: Colors.white,
          ),
          // flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }
}
