import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class GoogleButton extends ConsumerWidget {
  final googlebtnWidth;
  const GoogleButton({super.key, required this.googlebtnWidth});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async{
         try {
      final result = await ref.read(googleAuthFlowProvider.future);
      print('Success: $result');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Sign-In Successful')),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In Failed: $e')),
      );
    }
      },
      child: Container(
        width: googlebtnWidth,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: AppColors.transparentColor,
          border: Border.all(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(AppConstants.textFieldBorder)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/logo/google.svg"),
            const SizedBox(width: AppConstants.sizedBox10,),
            const Text("Continue with Google",
            style: AppTextstyle.headingMediumW,)

          ],
        ),
      ),
    );
  }
}
