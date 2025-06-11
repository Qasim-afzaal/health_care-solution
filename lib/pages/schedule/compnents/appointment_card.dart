import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/Utils/utils.dart';
import 'package:veritey/core/components/update_booking.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/schedule/model/appointment_model.dart';
import 'package:veritey/pages/schedule/schedule_page_controller.dart';
import 'package:veritey/pages/solution_care/solution_care_controller.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final String? type;
  final Color tagColor;

  AppointmentCard({
    super.key,
    required this.appointment,
    required this.type,
    this.tagColor = AppColors.blueCard,
  });

  final SchedulePageController schedulePageController =
      Get.put(SchedulePageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 290,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.fieldColor),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 7),
              _buildCategory(),
              const SizedBox(height: 7),
              const Divider(color: AppColors.fieldColor),
              const SizedBox(height: 10),
              _buildTimeInfo(),
              const SizedBox(height: 5),
              _buildLocationInfo(),
              const Spacer(),
              _buildActionButtons(context),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildDateTag(),
                const SizedBox(width: 9),
                _buildRating(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildUsername(),
                const SizedBox(width: 10),
                _buildStatusTag(),
              ],
            ),
          ],
        ),
        _buildPersonImage(),
      ],
    );
  }

  Widget _buildDateTag() {
    return AppointmentDateTag(
      date: appointment.date ?? "",
      color: tagColor,
    );
  }

  Widget _buildRating() {
    return const AppointmentRating(rating: "5.5");
  }

  Widget _buildUsername() {
    return Text(
      appointment.caretaker?.username ??
          appointment.careseeker?.username ??
          "N/A",
      style: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildStatusTag() {
    return AppointmentStatusTag(status: appointment.appointmentStatus);
  }

  Widget _buildPersonImage() {
    return PersonAvatarWithCategory(
      category: appointment.category?.name ?? "",
    );
  }

  Widget _buildCategory() {
    return Text(
      appointment.category?.name ?? "",
      style: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.textGrey,
      ),
    );
  }

  Widget _buildTimeInfo() {
    return AppointmentInfoRow(
      icon: CupertinoIcons.clock,
      text: Utils().formatAppointmentTime(appointment.fromTime ?? ""),
    );
  }

  Widget _buildLocationInfo() {
    return AppointmentInfoRow(
      icon: Icons.location_on_outlined,
      text: appointment.address ?? "",
      maxLength: 40,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    switch (type) {
      case "Upcoming":
        return _buildUpcomingActions();
      case "Completed":
        return _buildCompletedActions();
      default:
        return _buildPendingActions(context);
    }
  }

  Widget _buildUpcomingActions() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppButton.outline(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chat_bubble_outline,
                      color: AppColors.primary, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    "Chat",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppButton.primary(
              onPressed: () {},
              background: AppColors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit_calendar_outlined,
                      color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    "Edit",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompletedActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppButton.outline(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month_outlined,
                color: AppColors.primary, size: 18),
            const SizedBox(width: 8),
            Text(
              "Schedule Again",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingActions(BuildContext context) {
    final SolutionCareController solutionCareController =
        Get.put(SolutionCareController());

    return Row(
      children: [
        Expanded(
          child: AppButton.outline(
            onPressed: () {
              schedulePageController.cancelApi(appointment.id ?? "");
            },
            child: Text(
              "Cancel",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.red,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppButton.primary(
            onPressed: () {
              var date = appointment.date;
              solutionCareController.date.value = date ?? "";
              var time = Utils().formatAppointmentTime(appointment.fromTime);
              solutionCareController.time.value = time;
              var location = appointment.address;
              solutionCareController.location.value = location ?? "";
              solutionCareController.appoointmentID.value =
                  appointment.id ?? "";
              _showAddressBottomSheet(context);
            },
            background: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.edit_calendar_outlined,
                    color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  "Edit",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const UpdateBookingBottomSheet(),
    );
  }
}

// Reusable Components
class AppointmentDateTag extends StatelessWidget {
  final String date;
  final Color color;

  const AppointmentDateTag(
      {super.key, required this.date, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            Utils().formatAppointmentDate(date),
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentRating extends StatelessWidget {
  final String rating;

  const AppointmentRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.fieldColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, color: Colors.orangeAccent),
          const SizedBox(width: 5),
          Text(
            rating,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentStatusTag extends StatelessWidget {
  final String? status;

  const AppointmentStatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isPending = status == "pending";
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        color: isPending
            ? AppColors.fieldColor
            : AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: isPending ? AppColors.textGrey : AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isPending ? CupertinoIcons.clock : Icons.check,
              size: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status ?? "Unknown",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isPending ? AppColors.black : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class PersonAvatarWithCategory extends StatelessWidget {
  final String category;

  const PersonAvatarWithCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 65,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.fieldColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.person, color: AppColors.primary, size: 30),
        ),
        Positioned(
          bottom: -12,
          child: Container(
            height: 29,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(_getCategoryImage()),
            ),
          ),
        ),
      ],
    );
  }

  String _getCategoryImage() {
    switch (category) {
      case "Mental Health Support":
        return "assets/images/neuro.png";
      case "Home Health & Elder Care":
        return "assets/images/hospital.png";
      case "Medical Care Coordination":
        return "assets/images/binocullar.png";
      case "Caregiver Support":
        return "assets/images/care_giver.png";
      default:
        return "assets/images/nurse.png";
    }
  }
}

class AppointmentInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final int? maxLength;

  const AppointmentInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.fieldColor),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            _truncateText(),
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  String _truncateText() {
    if (maxLength != null && text.length > maxLength!) {
      return "${text.substring(0, maxLength!)}..";
    }
    return text;
  }
}
