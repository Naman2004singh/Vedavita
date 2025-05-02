import 'package:flutter/material.dart';
import 'package:vedavita/config/routes/routes_name.dart';
import 'package:vedavita/views/auth/login/login_screen.dart';
import 'package:vedavita/views/auth/register/register_screen.dart';
import 'package:vedavita/views/dashboard/dashboard_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
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
