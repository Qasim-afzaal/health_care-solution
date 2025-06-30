import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/update_booking.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/solution_care/solution_care_controller.dart';
import 'package:veritey/routes/app_pages.dart';

import '../../../core/Utils/utils.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SolutionCareController>(
      builder: (controller) {
        final bookingData = controller.bookingResponse?.data.data;
        if (bookingData == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButton(),
                  const SizedBox(height: 26),
                  _buildTitle(),
                  const SizedBox(height: 10),
                  _buildBookingCard(context, controller, bookingData),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Get.offNamed(Routes.DASHBOARD),
      child: const Icon(
        CupertinoIcons.back,
        size: 30,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Confirm Booking",
      style: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context,
      SolutionCareController controller, var bookingData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              _buildHeaderRow(controller, bookingData),
              const SizedBox(height: 7),
              _buildDescription(bookingData.category.description),
              const SizedBox(height: 7),
              const Divider(color: AppColors.fieldColor),
              const SizedBox(height: 10),
              _buildTimeRow(bookingData.fromTime),
              const SizedBox(height: 5),
              _buildLocationRow(bookingData.address),
              const Spacer(),
              _buildEditButton(context, controller, bookingData),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow(SolutionCareController controller, var bookingData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatusAndCategory(controller, bookingData),
        _buildCategoryImage(bookingData.category.name),
      ],
    );
  }

  Widget _buildStatusAndCategory(
      SolutionCareController controller, var bookingData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatusBadge(controller.bookingResponse?.data.data.status ?? ""),
        const SizedBox(height: 10),
        Text(
          bookingData.category.name,
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.blueCard.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blueCard),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: AppColors.blueCard,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.blueCard),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            status,
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

  Widget _buildCategoryImage(String categoryName) {
    String imagePath;
    switch (categoryName) {
      case "Mental Health Support":
        imagePath = "assets/images/neuro.png";
        break;
      case "Home Health & Elder Care":
        imagePath = "assets/images/hospital.png";
        break;
      case "Medical Care Coordination":
        imagePath = "assets/images/binocullar.png";
        break;
      case "Caregiver Support":
        imagePath = "assets/images/care_giver.png";
        break;
      case "Individual Intellectual Disability":
        imagePath = "assets/images/disable.png";
        break;
      default:
        imagePath = "assets/images/nurse.png";
    }

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.fieldColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          imagePath,
          scale: 1.2,
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.textGrey,
      ),
    );
  }

  Widget _buildTimeRow(String fromTime) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.clock,
          color: AppColors.fieldColor,
        ),
        const SizedBox(width: 6),
        Text(
          Utils().formatAppointmentTime(fromTime),
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow(String address) {
    String displayAddress =
        address.length > 30 ? "${address.substring(0, 30)}.." : address;
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: AppColors.fieldColor,
        ),
        const SizedBox(width: 5),
        Text(
          displayAddress,
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildEditButton(BuildContext context,
      SolutionCareController controller, var bookingData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppButton.outline(
        onPressed: () {
          controller.date.value = bookingData.date ?? "";
          controller.time.value =
              Utils().formatAppointmentTime(bookingData.fromTime);
          controller.location.value = bookingData.address ?? "";
          controller.appoointmentID.value = bookingData.id ?? "";
          _showAddressBottomSheet(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "Edit",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
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
