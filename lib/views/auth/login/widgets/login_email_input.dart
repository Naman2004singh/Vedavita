import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/config/components/input_decoration.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/utils/validators.dart';

class LoginEmailInput extends ConsumerWidget {
  const LoginEmailInput({super.key});

  onChagedValue(String value, WidgetRef ref) {
    ref.read(emailProviderLogin.notifier).update(
          (state) => value,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
        style: AppTextstyle.headingSmall,
        keyboardType: TextInputType.emailAddress,
        decoration: AppInputDecoration.textFieldDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            prefixicon: Icons.mail_outline),
        enabled: true,
        validator: emailValidator,
        onChanged: (value) => onChagedValue(value, ref));
  }
}
