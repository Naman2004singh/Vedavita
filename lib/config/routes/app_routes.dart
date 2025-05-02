import 'package:flutter/material.dart';
import 'package:vedavita/config/components/naviagtion.dart';
import 'package:vedavita/config/routes/routes_name.dart';
import 'package:vedavita/views/Image%20analysier/image_analyse.dart';
import 'package:vedavita/views/PROM%20screen/prom_screen.dart';
import 'package:vedavita/views/Profile/profile_screen.dart';
import 'package:vedavita/views/auth/login/login_screen.dart';
import 'package:vedavita/views/auth/register/register_screen.dart';
import 'package:vedavita/views/dashboard/dashboard_screen.dart';
import 'package:vedavita/views/emergency%20contact/emergency_contact_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {

      // auth screens
      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

        // navigation screens
        case RoutesName.navigationScreen:
        return MaterialPageRoute(
          builder: (context) => const AppNavigation(),
        );
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case RoutesName.promScreen:
        return MaterialPageRoute(
          builder: (context) => const PromScreen(),
        );
      case RoutesName.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RoutesName.imageAnalyseScreen:
        return MaterialPageRoute(
          builder: (context) => const ImageAnalyse(),
        );
      case RoutesName.emergencyScreen:
        return MaterialPageRoute(
          builder: (context) => const EmergencyContactScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No routes generated"),
              ),
            );
          },
        );
    }
  }
}
