import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/views/chatbot/chatbot_screen.dart';
import 'package:vedavita/views/dashboard/widgets/dashboard_appBar.dart';
import 'package:vedavita/views/dashboard/widgets/health_matric.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ));
          },
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/images/chatbot.png",
            scale: 1,
          )),
      body: ListView(
        children: [
          const DashboardAppbar(),
          const HealthMatric(),
          Image.asset(
            "assets/images/nnn.png",
            scale: 1.5,
          ),
        ],
      ),
    );
  }
}
