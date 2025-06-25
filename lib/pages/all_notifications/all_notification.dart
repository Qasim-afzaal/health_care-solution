import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/all_notifications/all_notification_controller.dart';
import 'package:veritey/pages/all_notifications/model/all_notification_model.dart';

class AllNotificationPage extends StatelessWidget {
  const AllNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildTabBar(),
              Expanded(
                child: GetBuilder<AllNotificationController>(
                  init: AllNotificationController(),
                  builder: (controller) {
                    final all =
                        controller.notificationResponse?.allNotifications ?? [];
                    final unread =
                        controller.notificationResponse?.unreadNotifications ??
                            [];

                    return TabBarView(
                      children: [
                        _buildNotificationList(all),
                        _buildNotificationList(unread),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
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
            "Notifications",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return GetBuilder<AllNotificationController>(
      builder: (controller) {
        final allCount =
            controller.notificationResponse?.allNotifications.length ?? 0;
        final unreadCount =
            controller.notificationResponse?.unreadNotifications.length ?? 0;

        return TabBar(
          labelColor: AppColors.primary,
          dividerColor: AppColors.fieldColor,
          unselectedLabelColor: AppColors.textGrey,
          indicatorColor: AppColors.primary,
          labelStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('All'),
                  const SizedBox(width: 6),
                  _buildCounter(allCount),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Unread'),
                  const SizedBox(width: 6),
                  _buildCounter(unreadCount),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCounter(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count.toString(),
        style: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildNotificationList(List<NotificationModel> notifications) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];

        return notifications.isEmpty
            ? const Center(child: Text("No notifications"))
            : GestureDetector(
                onTap: () {
                  final controller = Get.find<AllNotificationController>();
                  controller.markAsRead(notification.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: notification.readStatus
                        ? Colors.transparent
                        : AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    leading: Stack(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                notification.user!.profileImage,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    title: Text(
                      notification.title,
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      notification.body,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: !notification.readStatus
                            ? AppColors.black
                            : AppColors.textGrey,
                      ),
                    ),
                    trailing: Text(
                      _formatDate(notification.createdAt),
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ),
                ),
              );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }

  String _formatDate(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
