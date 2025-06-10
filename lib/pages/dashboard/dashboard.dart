import 'package:flutter/material.dart';

import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/chat/chat.dart';
import 'package:veritey/pages/dashboard/dashboard_controller.dart';
import 'package:veritey/pages/home/home.dart';
import 'package:veritey/pages/profile/profile.dart';
import 'package:veritey/pages/schedule/schedule_page.dart';
import 'package:veritey/pages/solution_care/solution_care.dart';
import 'package:veritey/widgets/custom_navbar.dart';
import 'package:veritey/widgets/lazy_stackindex.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashBoardController dashboardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          body: LazyIndexedStack(
            index: controller.currentIndex,
            children: [
              HomePage(),
              SchedulePage(),
              SolutionCare(),
              const ChatPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
