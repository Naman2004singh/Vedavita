import 'package:flutter/material.dart';
import 'package:vedavita/config/components/custom_container.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class HealthMatric extends StatelessWidget {
  const HealthMatric({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppConstants.textFieldBorder),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Health Metrics",
            style: AppTextstyle.bodyLargeB,
          ),
          SizedBox(
            height: 10.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomContainer(
                  assetName: "assets/images/barChart.svg",
                  boxText: "Recovery Score",
                  linearGradient: AppColors.greenGradient,
                ),
                SizedBox(
                  width: 20,
                ),
                CustomContainer(
                  assetName: "assets/images/heartRate.svg",
                  boxText: "Heart Rate",
                  linearGradient: AppColors.pinkGradient,
                ),
                SizedBox(
                  width: 20,
                ),
                CustomContainer(
                  assetName: "assets/images/sp02.svg",
                  boxText: "Spo2",
                  linearGradient: AppColors.yellowGradient,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
