import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/schedule/schedule_page_controller.dart';
import 'package:veritey/pages/schedule/tabs/completed/completed.dart';
import 'package:veritey/pages/schedule/tabs/pending/pending.dart';
import 'package:veritey/pages/schedule/tabs/upcoming/upcomming.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({super.key});

  final SchedulePageController scheduleController =
      Get.put(SchedulePageController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule'),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            labelColor: AppColors.primary,
            dividerColor: AppColors.fieldColor,
            unselectedLabelColor: AppColors.textGrey,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Pending'),
            ],
          ),
        ),
        body: Obx(() {
          if (scheduleController.isLoading.value) {
            return Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                color: AppColors.primary,
                size: 50,
              ),
            );
          } else {
            return SafeArea(
              child: TabBarView(
                children: [
                  const UpcommingSection(type: "Upcoming"),
                  CompletedSection(
                    type: "Completed",
                    completedAppointments: scheduleController
                            .appointmentsResponse?.data?.completed ??
                        [],
                  ),
                  PendingSection(
                    type: "Pending",
                    pendingAppointments: scheduleController
                            .appointmentsResponse?.data?.pending ??
                        [],
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
