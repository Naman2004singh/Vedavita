import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/config/components/flush_bar_helper.dart';
import 'package:vedavita/config/routes/routes_name.dart';
import 'package:vedavita/models/auth/register_model.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/repository/repository.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class RegisterButton extends ConsumerWidget {
  final btnWidht;
  final formKey;
  const RegisterButton(
      {super.key, required this.btnWidht, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(registerLoadingProvider);
    return GestureDetector(
        onTap: isLoading
            ? null
            : () async {
                if (formKey.currentState!.validate()) {
                  print("validate");
                  final name = ref.read(nameProvider) ?? '';
                  final email = ref.read(emailProviderRegister) ?? '';
                  final password = ref.read(passwordProviderRegister) ?? '';
                  // set loading true
                  ref.read(registerLoadingProvider.notifier).state = true;

                  try {
                    final RegisterResponse response = await Repository()
                        .registerApi({
                      "fullName": name,
                      "email": email,
                      "password": password
                    });

                    if (response.success == true) {
                      FlushBarHelper.flushBarSuccessMessage(
                          response.message ?? "Account created successfully",
                          context);

                      // Clear the text fields
                      formKey.currentState?.reset();
                      ref.invalidate(nameProvider);
                      ref.invalidate(emailProviderRegister);
                      ref.invalidate(passwordProviderRegister);

                      // navigate to login screen
                      Navigator.pushNamed(context, RoutesName.loginScreen);
                      // Navigator.pushNamed(context, RoutesName.dashboardScreen);
                    } else {
                      FlushBarHelper.flushBarErrorMessage(
                          response.message ?? "Registration failed", context);
                    }
                  } catch (e) {
                    FlushBarHelper.flushBarErrorMessage(e.toString(), context);
                  } finally {
                    ref.read(registerLoadingProvider.notifier).state = false;
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
                        "Creating",
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
                  "Create Account",
                  style: AppTextstyle.headingMediumW,
                  textAlign: TextAlign.center,
                ),
        ));
  }
}
