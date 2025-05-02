import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/config/components/input_decoration.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/utils/validators.dart';

class NameInput extends ConsumerWidget {
  const NameInput({super.key});

  onChagedValue(String value, WidgetRef ref) {
    ref.read(nameProvider.notifier).update(
          (state) => value,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
        style: AppTextstyle.headingSmall,
        keyboardType: TextInputType.name,
        decoration: AppInputDecoration.textFieldDecoration(
            labelText: "Full Name",
            hintText: "Enter your full name",
            prefixicon: Icons.person),
        enabled: true,
        validator: nameValidator,
        onChanged: (value) => onChagedValue(value, ref));
  }
}
