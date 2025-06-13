import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/components/booking_bottom_sheet.dart';
import 'package:veritey/pages/solution_care/care_giver/care_giver_controller.dart';

import '../../../core/constants/app_colors.dart';

class CareGiverPage extends StatelessWidget {
  CareGiverPage({super.key});
  final CareGiverController controller = Get.put(CareGiverController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        CupertinoIcons.back,
                        size: 30,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Detail",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/blutooth.png",
                      scale: 1.5,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Image.asset(
                  "assets/images/care_giver_booking.png",
                  scale: 1.5,
                ),
                const SizedBox(height: 15),
                Text(
                  "Caregiver Support",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Empowering caregivers with resources, education, and personalized support.",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.textGrey.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 20),
                TabBar(
                  labelColor: AppColors.primary,
                  dividerColor: AppColors.fieldColor,
                  unselectedLabelColor: AppColors.textGrey,
                  indicatorColor: AppColors.primary,
                  labelStyle: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600, fontSize: 12.5),
                  tabs: const [
                    Tab(text: "Benefits"),
                    Tab(text: "When to use"),
                    Tab(text: "How It Works"),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: AppColors.fieldColor, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Key Benefits",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/check.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "One-on-one coaching for caregiving techniques",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/check.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Educational seminars on balancing work and caregiving",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/check.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Access to expert guidance for challenging caregiving situations",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: AppColors.fieldColor, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "When To Use",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Facing challenges in managing caregiving responsibilities",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Needing professional tips for better caregiving practices",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Looking for strategies to balance caregiving with work",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: AppColors.fieldColor, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How It Works?",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Step 1",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Choose your preferred support type (e.g., Seminar, Coaching)",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Step 2",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Select your preferred date and time",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Step 3",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Attend the session or receive personalized coaching",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.fieldColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton.primary(
                    onPressed: () {
                      _showAddressBottomSheet(context);
                    },
                    background: AppColors.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book an Apointmentinue",
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BookingBottomSheet(),
    );
  }
}
