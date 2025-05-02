import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/config/components/input_decoration.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/utils/validators.dart';

class LoginPasswordInput extends ConsumerWidget {
  const LoginPasswordInput({super.key});

  onChagedValue(String value, WidgetRef ref) {
    ref.read(passwordProviderLogin.notifier).update(
          (state) => value,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
        style: AppTextstyle.headingSmall,
        keyboardType: TextInputType.visiblePassword,
        decoration: AppInputDecoration.textFieldDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            prefixicon: Icons.lock_outline),
        enabled: true,
        validator: passwordValidator,
        onChanged: (value) => onChagedValue(value, ref));
  }
}
