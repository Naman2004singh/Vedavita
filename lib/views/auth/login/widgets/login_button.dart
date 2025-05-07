import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/config/components/flush_bar_helper.dart';
import 'package:vedavita/config/routes/routes_name.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/models/auth/login_model.dart';
import 'package:vedavita/repository/auth_repository.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class LoginButton extends ConsumerWidget {
  final btnWidht;
  final formKey;
  const LoginButton({super.key, required this.btnWidht, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginLodingProvider);
    return GestureDetector(
        onTap: isLoading
            ? null
            : () async {
                if (formKey.currentState!.validate()) {
                  print("validate");
                  final email = ref.read(emailProviderLogin) ?? '';
                  final password = ref.read(passwordProviderLogin) ?? '';
                  // set loading true
                  ref.read(loginLodingProvider.notifier).state = true;

                  try {
                    final LoginResponse response = await Repository()
                        .loginApi({"email": email, "password": password});

                    if (response.success == true) {
                      FlushBarHelper.flushBarSuccessMessage(
                          response.message ?? "Login successfully", context);

                      // Clear the text fields
                      formKey.currentState?.reset();
                      ref.invalidate(emailProviderLogin);
                      ref.invalidate(passwordProviderLogin);

                      // navigate to login screen
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.navigationScreen,
                        (route) => false,
                      );
                    } else {
                      FlushBarHelper.flushBarErrorMessage(
                          response.message ?? "Login failed", context);
                    }
                  } catch (e) {
                    FlushBarHelper.flushBarErrorMessage(e.toString(), context);
                  } finally {
                    ref.read(loginLodingProvider.notifier).state = false;
                  }
                }
              },
        child: Container(
          width: btnWidht,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.textFieldBorder),
              color: isLoading
                  ? AppColors.btnColor.withOpacity(0.7)
                  : AppColors.btnColor),
          child: isLoading
              ? const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Loading",
                        style: AppTextstyle.headingMediumW,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ),
                    ],
                  ),
                )
              : const Text(
                  "Login",
                  style: AppTextstyle.headingMediumW,
                  textAlign: TextAlign.center,
                ),
        ));
  }
}
