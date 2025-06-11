import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:veritey/core/components/change_location.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/home/components/shedule.dart';
import 'package:veritey/pages/home/home_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          final upcomingMeetings =
              controller.dashboardData?.data?.upcomingMeetings;
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 219,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFE6F0F2),
                          child: Icon(
                            Icons.person,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome, ${controller.mainModel?.data?.username ?? ""}',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.backgroundColor,
                              ),
                            ),
                            Text(
                              'Welcome to Care Solution',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ALL_CHAT);
                          },
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F0F2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications_active_outlined,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 68,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F0F2),
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.primary,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'Current Location',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        (controller.mainModel?.data?.location
                                                        ?.address?.length ??
                                                    0) >
                                                30
                                            ? '${controller.mainModel?.data?.location?.address?.substring(0, 30)}...'
                                            : controller.mainModel?.data
                                                    ?.location?.address ??
                                                "",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      // Flexible(
                                      //   child: Text(
                                      //     controller.mainModel?.data?.location
                                      //             ?.address ??
                                      //         "",
                                      //     style: GoogleFonts.plusJakartaSans(
                                      //       fontWeight: FontWeight.w400,
                                      //       fontSize: 14,
                                      //       color: AppColors.black,
                                      //     ),
                                      //     overflow: TextOverflow.ellipsis,
                                      //     maxLines: 1,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changeLocation(context);
                                },
                                child: Text(
                                  'Change',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 183,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/service.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE6F0F2),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/images/care.png",
                                            scale: 1.8,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controller.dashboardData!.data
                                              ?.completedCount
                                              .toString() ??
                                          "",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: AppColors.backgroundColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Service Completed',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColors.backgroundColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 167,
                                  height: 87,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/upcomming_meeting.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE6F0F2),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/images/shed.png",
                                            scale: 1.8,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.dashboardData!.data
                                                    ?.upcomingCount
                                                    .toString() ??
                                                "",
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: AppColors.backgroundColor,
                                            ),
                                          ),
                                          Text(
                                            'Upcoming Meeting',
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: AppColors.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 167,
                                  height: 87,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/pending_request.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE6F0F2),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/images/time.png",
                                            scale: 1.8,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.dashboardData!.data
                                                    ?.pendingCount
                                                    .toString() ??
                                                "",
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: AppColors.backgroundColor,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Pending request',
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: AppColors.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upcoming Meetings',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              'View all',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      upcomingMeetings == null || upcomingMeetings.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() {
                                    final formattedDate =
                                        DateFormat('EEEE, d MMM').format(
                                            controller.selectedDate.value);
                                    return Text(
                                      formattedDate,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: AppColors.textGrey,
                                      ),
                                    );
                                  }),
                                  GestureDetector(
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showModalBottomSheet<DateTime>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          DateTime tempPickedDate =
                                              controller.selectedDate.value;
                                          return Container(
                                            height: 300,
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                          color: CupertinoColors
                                                              .separator),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CupertinoButton(
                                                        child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: CupertinoColors
                                                                    .systemBlue)),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                      ),
                                                      CupertinoButton(
                                                        child: const Text(
                                                            'Done',
                                                            style: TextStyle(
                                                                color: CupertinoColors
                                                                    .systemBlue)),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                tempPickedDate),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    initialDateTime: controller
                                                        .selectedDate.value,
                                                    minimumDate: DateTime(2000),
                                                    maximumDate: DateTime(2100),
                                                    onDateTimeChanged:
                                                        (DateTime date) {
                                                      tempPickedDate = date;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );

                                      if (pickedDate != null &&
                                          pickedDate !=
                                              controller.selectedDate.value) {
                                        controller.setSelectedDate(pickedDate);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: AppColors.containerColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.calendar_today,
                                              size: 16, color: AppColors.black),
                                          const SizedBox(width: 8),
                                          Obx(() {
                                            final formattedMonth =
                                                DateFormat('MMM, yyyy').format(
                                                    controller
                                                        .selectedDate.value);
                                            return Text(
                                              formattedMonth,
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                            );
                                          }),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.keyboard_arrow_down,
                                              size: 18, color: AppColors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: (upcomingMeetings == null ||
                                upcomingMeetings.isEmpty)
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'No upcoming meetings',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: upcomingMeetings.length,
                                itemBuilder: (context, index) {
                                  final meeting = upcomingMeetings[index];

                                  return ScheduleCard(
                                    containerColor: _getCategoryContainerColor(
                                        meeting.category?.name ?? ""),
                                    borderColor: _getCategoryBorderColor(
                                        meeting.category?.name ?? ""),
                                    name: meeting.caretaker?.username ?? 'N/A',
                                    title: meeting.category?.name ?? 'N/A',
                                    address: meeting.address ?? 'N/A',
                                    iconPath: _getCategoryImage(
                                        meeting.category!.name ?? ""),
                                  );
                                },
                              ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Color _getCategoryContainerColor(String category) {
    switch (category) {
      case "Mental Health Support":
        return AppColors.greenCard.withOpacity(0.1);
      case "Home Health & Elder Care":
        return AppColors.blueCard.withOpacity(0.1);
      case "Medical Care Coordination":
        return AppColors.orangeCard.withOpacity(0.1);
      case "Caregiver Support":
        return AppColors.red.withOpacity(0.1);
      default:
        return AppColors.purpleColor.withOpacity(0.2);
    }
  }

  Color _getCategoryBorderColor(String category) {
    switch (category) {
      case "Mental Health Support":
        return AppColors.primary;
      case "Home Health & Elder Care":
        return AppColors.blueCard.withOpacity(0.2);
      case "Medical Care Coordination":
        return AppColors.orangeCard.withOpacity(0.2);
      case "Caregiver Support":
        return AppColors.pinkColor.withOpacity(0.2);
      default:
        return AppColors.purpleColor.withOpacity(0.2);
    }
  }

  String _getCategoryImage(catogory) {
    switch (catogory) {
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

  void _changeLocation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const ChangeLocation(),
        );
      },
    );
  }
}
