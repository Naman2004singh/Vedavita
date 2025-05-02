// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vedavita/utils/app_constants.dart';

// class DashboardAppbar extends ConsumerWidget {
//   const DashboardAppbar({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       width: AppConstants.screenWidth(context),
//       height: 200,
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: SvgPicture.asset)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vedavita/utils/app_constants.dart';
import 'package:vedavita/utils/app_colors.dart';
// import 'package:vedavita/providers/user_provider.dart';
// import 'package:vedavita/providers/health_metrics_provider.dart';
import 'package:intl/intl.dart';
import 'package:vedavita/utils/app_textstyle.dart';

class DashboardAppbar extends ConsumerWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);
    // final healthMetrics = ref.watch(healthMetricsProvider);
    final now = DateTime.now();
    final formattedDate = DateFormat('MMMM d, yyyy').format(now);

    return SizedBox(
      width: AppConstants.screenWidth(context),
      height: 230,
      child: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset(
              'assets/images/dashboardB.svg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          // user.avatarUrl != null
                          // ? NetworkImage(user.avatarUrl!)
                          // :
                          const AssetImage('assets/images/default_image.png')
                              as ImageProvider,
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello',
                              // ${user.name}
                              style: AppTextstyle.headingLargeW),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              // BPM indicator
                              const Icon(
                                Icons.favorite,
                                size: 15,
                                color: Colors.white70,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                // '${healthMetrics.heartRate} bpm',
                                'bpm',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Recovery indicator
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  // '${healthMetrics.recoveryPercentage}% recovered',
                                  'recovered',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "You're doing well!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Notification icon
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(7.0)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Last updated timestamp
                Text('Last updated: $formattedDate',
                    style: AppTextstyle.headingSmallW),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
