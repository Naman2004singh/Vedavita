import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class CustomContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String assetName;
  final String boxText;
  const CustomContainer({
    super.key, required this.color1, required this.color2, required this.assetName, required this.boxText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          SvgPicture.asset(assetName),
          const SizedBox(
            height: 40.0,
          ),
          Text(boxText,style: AppTextstyle.bodyLargeB,)
        ],
      ),
    );
  }
}
