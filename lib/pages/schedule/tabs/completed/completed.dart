import 'package:flutter/material.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/schedule/compnents/appointment_card.dart';
import 'package:veritey/pages/schedule/model/appointment_model.dart';

class CompletedSection extends StatelessWidget {
  const CompletedSection({
    super.key,
    required this.type,
    required this.completedAppointments,
  });

  final String? type;
  final List<Appointment> completedAppointments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: completedAppointments.isEmpty
          ? const Center(child: Text("No completed appointments"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: completedAppointments.length,
              itemBuilder: (context, index) => AppointmentCard(
                appointment: completedAppointments[index],
                type: type,
                tagColor: AppColors.blueCard,
              ),
            ),
    );
  }
}
