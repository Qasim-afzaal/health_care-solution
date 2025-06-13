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
      builder: (solutionCareController) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.DASHBOARD);
                    },
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    "Confirm Booking",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: AppColors.blueCard
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.blueCard),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  color: AppColors.blueCard,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color:
                                                          AppColors.blueCard),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                solutionCareController
                                                        .bookingResponse
                                                        ?.data
                                                        .data
                                                        .status ??
                                                    "",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          solutionCareController.bookingResponse
                                                  ?.data.data.category.name ??
                                              "",
                                          style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.fieldColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      solutionCareController.bookingResponse
                                                  ?.data.data.category.name ==
                                              "Mental Health Support"
                                          ? "assets/images/neuro.png"
                                          : solutionCareController
                                                      .bookingResponse
                                                      ?.data
                                                      .data
                                                      .category
                                                      .name ==
                                                  "Home Health & Elder Care"
                                              ? "assets/images/hospital.png"
                                              : solutionCareController
                                                          .bookingResponse
                                                          ?.data
                                                          .data
                                                          .category
                                                          .name ==
                                                      "Medical Care Coordination"
                                                  ? "assets/images/binocullar.png"
                                                  : solutionCareController
                                                              .bookingResponse
                                                              ?.data
                                                              .data
                                                              .category
                                                              .name ==
                                                          "Caregiver Support"
                                                      ? "assets/images/care_giver.png"
                                                      : "assets/images/nurse.png",
                                      scale: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Text(
                              solutionCareController.bookingResponse?.data.data
                                      .category.description ??
                                  "",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.textGrey,
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Divider(color: AppColors.fieldColor),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.clock,
                                  color: AppColors.fieldColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  Utils().formatAppointmentTime(
                                      solutionCareController.bookingResponse
                                              ?.data.data.fromTime ??
                                          ""),
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.fieldColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  (solutionCareController.bookingResponse?.data
                                                      .data.address ??
                                                  "")
                                              .length >
                                          30
                                      ? "${solutionCareController.bookingResponse?.data.data.address.substring(0, 30)}.."
                                      : solutionCareController.bookingResponse
                                              ?.data.data.address ??
                                          "",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: AppButton.outline(
                                onPressed: () {
                                  var date = solutionCareController
                                      .bookingResponse?.data.data.date;
                                  solutionCareController.date.value =
                                      date ?? "";

                                  var time = Utils().formatAppointmentTime(
                                      solutionCareController
                                          .bookingResponse?.data.data.fromTime);
                                  solutionCareController.time.value = time;

                                  var location = solutionCareController
                                      .bookingResponse?.data.data.address;
                                  solutionCareController.location.value =
                                      location ?? "";

                                  solutionCareController.appoointmentID.value =
                                      solutionCareController
                                              .bookingResponse?.data.data.id ??
                                          "";

                                  _showAddressBottomSheet(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
