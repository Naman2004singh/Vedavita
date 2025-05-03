import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class CustomContainer extends StatelessWidget {
  // final Color color1;
  // final Color color2;
  final LinearGradient linearGradient;
  final String assetName;
  final String boxText;
  final VoidCallback? onTap;
  const CustomContainer({
    super.key,
    required this.assetName,
    required this.boxText,
    required this.linearGradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            SvgPicture.asset(assetName),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  boxText,
                  style: AppTextstyle.bodyLargeB,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: AppColors.blackColor,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
