import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:veritey/core/components/change_location.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/dashboard/dashboard_controller.dart';
import 'package:veritey/pages/home/components/shedule.dart';
import 'package:veritey/pages/home/home_controller.dart';
import 'package:veritey/pages/profile/profile_controller.dart';
import 'package:veritey/routes/app_pages.dart';

import '../../core/Utils/utils.dart';

const EdgeInsetsGeometry _kAllPadding8 = EdgeInsets.all(8.0);
const EdgeInsetsGeometry _kAllPadding20 = EdgeInsets.all(20.0);
const EdgeInsetsGeometry _kSymmetricPadding15Top =
    EdgeInsets.only(left: 15, right: 15, top: 8.0);
const EdgeInsetsGeometry _kSymmetricPadding15Top10 =
    EdgeInsets.only(left: 15, right: 15, top: 10);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashBoardController>();

    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          final upcomingMeetings =
              controller.dashboardData?.data?.upcomingMeetings;

          return Column(
            children: [
              _buildHeaderSection(context, controller, profileController),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildDashboardMetrics(controller),
                      const SizedBox(height: 10),
                      _buildUpcomingMeetingsHeader(dashboardController),
                      _buildDateSelector(context, controller),
                      const SizedBox(height: 10),
                      _buildUpcomingMeetingsList(
                          upcomingMeetings, controller.selectedDate.value),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context, HomeController controller,
      ProfileController profileController) {
    return Container(
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
          const SizedBox(height: 50),
          _buildUserProfileAndNotification(controller, profileController)
              .paddingSymmetric(horizontal: 16),
          const SizedBox(height: 16),
          _buildLocationCard(context, controller),
        ],
      ),
    );
  }

  Widget _buildUserProfileAndNotification(
      HomeController controller, ProfileController profileController) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        final profileImage = profileController.mainModel?.data?.profileImage;

        return Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.fieldColor,
              child: profileImage != null && profileImage != ""
                  ? ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: profileImage,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: 40,
                        ),
                      ),
                    )
                  : const Icon(Icons.person,
                      color: AppColors.primary, size: 40),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.mainModel?.data?.username ?? "",
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
              onTap: () => Get.toNamed(Routes.ALL_NOTIFICATIONS),
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
        );
      },
    );
  }

  Widget _buildLocationCard(BuildContext context, HomeController controller) {
    final String locationAddress =
        controller.mainModel?.data?.location?.locationAddress ?? "";

    final String displayedAddress = locationAddress.length > 30
        ? '${locationAddress.substring(0, 30)}...'
        : locationAddress;

    return Padding(
      padding: _kAllPadding8,
      child: Container(
        width: double.infinity,
        height: 68,
        decoration: BoxDecoration(
          color: const Color(0xFFE6F0F2),
          borderRadius: BorderRadius.circular(48),
        ),
        child: Padding(
          padding: _kAllPadding8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        'Current Location',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        displayedAddress,
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => _changeLocation(context),
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
    );
  }

  Widget _buildDashboardMetrics(HomeController controller) {
    return Padding(
      padding: _kAllPadding8,
      child: Row(
        children: [
          _buildServiceCompletedCard(
              controller.dashboardData?.data?.completedCount ?? 0),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMeetingCard(
                imagePath: "assets/images/upcomming_meeting.png",
                iconPath: "assets/images/shed.png",
                count: controller.dashboardData?.data?.upcomingCount ?? 0,
                title: 'Upcoming Meeting',
              ),
              const SizedBox(height: 10),
              _buildMeetingCard(
                imagePath: "assets/images/pending_request.png",
                iconPath: "assets/images/time.png",
                count: controller.dashboardData?.data?.pendingCount ?? 0,
                title: 'Pending request',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCompletedCard(int count) {
    return Expanded(
      child: Container(
        height: 183,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/service.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F0F2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: _kAllPadding8,
                child: Image.asset("assets/images/care.png", scale: 1.8),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              count.toString(),
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.backgroundColor,
              ),
            ),
            const SizedBox(height: 10),
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
    );
  }

  Widget _buildMeetingCard({
    required String imagePath,
    required String iconPath,
    required int count,
    required String title,
  }) {
    return Container(
      width: 167,
      height: 87,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
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
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: _kAllPadding8,
              child: Image.asset(iconPath, scale: 1.8),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count.toString(),
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: AppColors.backgroundColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
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
    );
  }

  Widget _buildUpcomingMeetingsHeader(DashBoardController dashboardController) {
    return Padding(
      padding: _kSymmetricPadding15Top,
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
          GestureDetector(
            onTap: () => dashboardController.viewAll(1),
            child: Text(
              'View all',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context, HomeController controller) {
    return Padding(
      padding: _kSymmetricPadding15Top10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () {
              final formattedDate = DateFormat('EEEE, d MMM')
                  .format(controller.selectedDate.value);
              return Text(
                formattedDate,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.textGrey,
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate =
                  await _showDatePickerModal(context, controller);
              if (pickedDate != null &&
                  pickedDate != controller.selectedDate.value) {
                controller.setSelectedDate(pickedDate);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  Obx(
                    () {
                      final formattedMonth = DateFormat('MMM, yyyy')
                          .format(controller.selectedDate.value);
                      return Text(
                        formattedMonth,
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.keyboard_arrow_down,
                      size: 18, color: AppColors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _showDatePickerModal(
      BuildContext context, HomeController controller) async {
    return await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        DateTime tempPickedDate = controller.selectedDate.value;
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: CupertinoColors.separator),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text('Cancel',
                          style: TextStyle(color: CupertinoColors.systemBlue)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoButton(
                      child: const Text('Done',
                          style: TextStyle(color: CupertinoColors.systemBlue)),
                      onPressed: () => Navigator.pop(context, tempPickedDate),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: controller.selectedDate.value,
                  minimumDate: DateTime(2000),
                  maximumDate: DateTime(2100),
                  onDateTimeChanged: (DateTime date) {
                    tempPickedDate = date;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUpcomingMeetingsList(
    List<dynamic>? upcomingMeetings,
    DateTime selectedDate,
  ) {
    if (upcomingMeetings == null || upcomingMeetings.isEmpty) {
      return Padding(
        padding: _kAllPadding20,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'No upcoming meetings',
              style: Theme.of(Get.context!).textTheme.titleMedium,
            ),
          ],
        ),
      );
    } else {
      final filteredMeetings = upcomingMeetings.where((meeting) {
        final meetingDateStr = meeting.date ?? "";
        if (meetingDateStr.isEmpty) return false;

        final meetingDate = DateTime.tryParse(meetingDateStr);
        if (meetingDate == null) return false;

        return meetingDate.year == selectedDate.year &&
            meetingDate.month == selectedDate.month &&
            meetingDate.day == selectedDate.day;
      }).toList();

      if (filteredMeetings.isEmpty) {
        return Padding(
          padding: _kAllPadding20,
          child: Text(
            'No meetings on this date',
            style: Theme.of(Get.context!).textTheme.titleMedium,
          ),
        );
      }

      return MediaQuery.removePadding(
        removeTop: true,
        context: Get.context!,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredMeetings.length,
          itemBuilder: (context, index) {
            final meeting = filteredMeetings[index];

            return ScheduleCard(
              containerColor: Utils()
                  .getCategoryContainerColor(meeting.category?.name ?? ""),
              borderColor:
                  Utils().getCategoryBorderColor(meeting.category?.name ?? ""),
              profile: meeting.caretaker.profileImage ?? "",
              fromTime: meeting.fromTime ?? "",
              name: meeting.caretaker?.username ?? 'N/A',
              title: meeting.category?.name ?? 'N/A',
              address: meeting.address ?? 'N/A',
              iconPath: Utils().getCategoryImage(meeting.category!.name ?? ""),
            );
          },
        ),
      );
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
