import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/components/booking_bottom_sheet.dart';
import 'package:veritey/pages/solution_care/on_demand/on_demand_controller.dart';

import '../../../core/constants/app_colors.dart';

class OnDemandPage extends StatelessWidget {
  OnDemandPage({super.key});
  final OnDemandController controller = Get.put(OnDemandController());

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
                  "assets/images/onDemand.png",
                  scale: 1.5,
                ),
                const SizedBox(height: 15),
                Text(
                  "On Demand Nurse",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "24/7 access to professional healthcare guidance for urgent or general medical concerns.",
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
                                        "Immediate access to qualified nurses for health guidance",
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
                                        "Assistance with medication inquiries, symptom checks, and urgent care support",
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
                                        "Personalized health advice for non-emergency situations",
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
                                        "Seeking guidance for urgent but non-emergency medical issues",
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
                                        "Needing advice on medication usage or side effects",
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
                                        "Looking for professional advice on minor injuries or health concerns",
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
                                        "Call the 24/7 Nurse Line or request a callback",
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
                                        "Speak with a certified nurse for immediate guidance",
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
                                        "Receive follow-up instructions or referrals if needed",
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
