import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:veritey/pages/schedule/compnents/appointment_card.dart';
import 'package:veritey/pages/schedule/schedule_page_controller.dart';

class UpcommingSection extends StatefulWidget {
  const UpcommingSection({super.key, required this.type});
  final String? type;

  @override
  State<UpcommingSection> createState() => _UpcommingSectionState();
}

class _UpcommingSectionState extends State<UpcommingSection> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SchedulePageController>();
    final upcomingList = controller.appointmentsResponse?.data?.upcoming;

    return Scaffold(
      body: upcomingList == null || upcomingList.isEmpty
          ? const Center(child: Text("No upcoming appointments"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: upcomingList.length,
              itemBuilder: (context, index) => AppointmentCard(
                appointment: upcomingList[index],
                type: widget.type,
              ),
            ),
    );
  }
}
