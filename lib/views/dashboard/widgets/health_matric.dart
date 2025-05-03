import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vedavita/config/components/custom_container.dart';
// import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_textstyle.dart';
import 'package:vedavita/views/dashboard/widgets/blood%20pressure/bp_screen.dart';
import 'package:vedavita/views/dashboard/widgets/heart/heart_dahboard.dart';

class HealthMatric extends StatelessWidget {
  const HealthMatric({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.textFieldBorder),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LinearCharts(),
                        ));
                  },
                  child: SvgPicture.asset(
                    "assets/logo/bp.svg",
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HeartRateDashboardPage(),
                        ));
                  },
                  child: SvgPicture.asset(
                    "assets/logo/heart.svg",
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SvgPicture.asset(
                  "assets/logo/spo2.svg",
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SvgPicture.asset(
                  "assets/logo/temp.svg",
                ),
                const SizedBox(
                  width: 20.0,
                ),

                // CustomContainer(
                //   assetName: "assets/images/heartRate.svg",
                //   boxText: "Heart Rate",
                //   linearGradient: AppColors.pinkGradient,
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 const HeartRateDashboardPage()));
                //   },
                // ),
                // const SizedBox(
                //   width: 20,
                // ),
                // CustomContainer(
                //   assetName: "assets/images/sp02.svg",
                //   boxText: "Spo2",
                //   linearGradient: AppColors.yellowGradient,
                //   onTap: () {},
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
