import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/auth_provider.dart';
import 'package:vedavita/utils/app_colors.dart';
import 'package:vedavita/views/PROM%20screen/prom_screen.dart';
import 'package:vedavita/views/Image analysier/image_analyse.dart';
import 'package:vedavita/views/Profile/profile_screen.dart';
import 'package:vedavita/views/dashboard/dashboard_screen.dart';
import 'package:vedavita/views/emergency%20contact/emergency_contact_screen.dart';

class AppNavigation extends ConsumerWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationProvider);
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          DashboardScreen(),
          ImageAnalyse(),
          EmergencyContactScreen(),
          PromScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        selectedIconTheme: const IconThemeData(
          color: AppColors.mainColor,
        ),
        unselectedItemColor: AppColors.blackColor,
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(navigationProvider.notifier).update((state) => index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: AppColors.blackColor,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: AppColors.blackColor,
            ),
            label: 'Image Analyse',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone,
              color: AppColors.blackColor,
            ),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
              color: AppColors.blackColor,
            ),
            label: 'PROM',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.blackColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
