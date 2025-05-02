import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vedavita/config/routes/routes_name.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_strings.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/views/auth/login/widgets/login_button.dart';
import 'package:vedavita/views/auth/login/widgets/login_email_input.dart';
import 'package:vedavita/views/auth/login/widgets/login_password_input.dart';
import 'package:vedavita/views/auth/register/textData.dart';
import 'package:vedavita/views/auth/register/widgets/google_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final loginformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = AppConstants.screenHeight(context);
    final screenWidth = AppConstants.screenWidth(context);
    const padding = AppConstants.mainPadding;
    // const smallSizedBox = AppConstants.sizedBox10;
    const screenPadding = AppConstants.padding30;
    const bigSize = AppConstants.registerScreen40;
    return Stack(
      children: [
        Positioned.fill(
            child: SvgPicture.asset("assets/images/Background.svg")),
        Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Form(
              key: loginformKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: screenPadding),
                children: [
                  SizedBox(
                    height: screenHeight / 4.0,
                  ),
                  const Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: AppTextstyle.headingLargeW,
                  ),
                  const Text(
                    AppStrings.signInPageString,
                    textAlign: TextAlign.center,
                    style: AppTextstyle.headingSmallW,
                  ),
                  const SizedBox(
                    height: bigSize,
                  ),
                  const LoginEmailInput(),
                  const SizedBox(
                    height: padding,
                  ),
                  const LoginPasswordInput(),
                  const SizedBox(
                    height: bigSize,
                  ),
                  LoginButton(btnWidht: screenWidth, formKey: loginformKey),
                  const SizedBox(
                    height: bigSize,
                  ),
                  orData(),
                  const SizedBox(
                    height: bigSize,
                  ),
                  GoogleButton(googlebtnWidth: screenWidth),
                  const SizedBox(
                    height: padding,
                  ),
                  RichText(
                    text: notHaveAccount(
                      () {
                        Navigator.pushNamed(context, RoutesName.registerScreen);
                      },
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        )
      ],
    );
  }
}
