import 'package:flutter/material.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/schedule/compnents/appointment_card.dart';
import 'package:veritey/pages/schedule/model/appointment_model.dart';

class PendingSection extends StatelessWidget {
  const PendingSection({
    super.key,
    required this.type,
    required this.pendingAppointments,
  });

  final String? type;
  final List<Appointment> pendingAppointments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pendingAppointments.isEmpty
          ? const Center(child: Text("No pending appointments"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: pendingAppointments.length,
              itemBuilder: (context, index) => AppointmentCard(
                appointment: pendingAppointments[index],
                type: type,
                tagColor: AppColors.blueCard,
              ),
            ),
    );
  }
}
