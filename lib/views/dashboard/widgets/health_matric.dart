import 'package:flutter/material.dart';
import 'package:vedavita/config/components/custom_container.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/views/dashboard/widgets/heart/heart_dahboard.dart';

class HealthMatric extends StatelessWidget {
  const HealthMatric({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.textFieldBorder),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Health Metrics",
            style: AppTextstyle.bodyLargeB,
          ),
          const SizedBox(
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
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const HeartRateDashboardPage()));
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CustomContainer(
                  assetName: "assets/images/heartRate.svg",
                  boxText: "Heart Rate",
                  linearGradient: AppColors.pinkGradient,
                  onTap: () {
                    
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CustomContainer(
                  assetName: "assets/images/sp02.svg",
                  boxText: "Spo2",
                  linearGradient: AppColors.yellowGradient,
                  onTap: () {
                    
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
