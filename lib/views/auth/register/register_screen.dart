import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vedavita/config/routes/routes_name.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_strings.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/views/auth/register/widgets/register_button.dart';
import 'package:vedavita/views/auth/register/textData.dart';
import 'package:vedavita/views/auth/register/widgets/email_input.dart';
import 'package:vedavita/views/auth/register/widgets/google_button.dart';
import 'package:vedavita/views/auth/register/widgets/name_input.dart';
import 'package:vedavita/views/auth/register/widgets/password_input.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final registerformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = AppConstants.screenHeight(context);
    final screenWidth = AppConstants.screenWidth(context);
    const padding = AppConstants.mainPadding;
    const smallSizedBox = AppConstants.sizedBox10;
    const screenPadding = AppConstants.padding30;
    const bigSize = AppConstants.registerScreen40;
    return Stack(
      children: [
        Positioned.fill(
            child: SvgPicture.asset("assets/images/Background.svg")),
        Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Form(
            key: registerformKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: screenPadding),
              children: [
                SizedBox(
                  height: screenHeight / 6.0,
                ),
                const Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: AppTextstyle.headingLargeW,
                ),
                const Text(
                  AppStrings.signUpPageString,
                  textAlign: TextAlign.center,
                  style: AppTextstyle.headingSmallW,
                ),
                const SizedBox(
                  height: bigSize,
                ),
                const NameInput(),
                const SizedBox(
                  height: padding,
                ),
                const EmailInput(),
                const SizedBox(
                  height: padding,
                ),
                const PasswordInput(),
                const SizedBox(
                  height: bigSize,
                ),
                RegisterButton(
                  btnWidht: screenWidth,
                  formKey: registerformKey,
                ),
                const SizedBox(
                  height: bigSize,
                ),
                RichText(
                  text: privacySpan(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: smallSizedBox,
                ),
                orData(), // text
                const SizedBox(
                  height: smallSizedBox,
                ),
                GoogleButton(googlebtnWidth: screenWidth),
                const SizedBox(
                  height: padding,
                ),
                RichText(
                  text: haveAccount(
                    () {
                      Navigator.pushNamed(context, RoutesName.loginScreen);
                    },
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
