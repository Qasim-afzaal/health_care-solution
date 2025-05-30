import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/home/home_controller.dart';

class AllChatPage extends StatelessWidget {
  AllChatPage({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Map<String, dynamic>> readMessages = [
    {
      "name": "John Doe",
      "lastMessage": "Hey, how are you?",
      "imageUrl": "https://i.pravatar.cc/150?img=1",
      "time": "10:30 AM",
      "isUnread": false,
    },
    {
      "name": "Alice",
      "lastMessage": "Let’s catch up later.",
      "imageUrl": "https://i.pravatar.cc/150?img=2",
      "time": "9:15 AM",
      "isUnread": false,
    },
  ];

  final List<Map<String, dynamic>> unreadMessages = [
    {
      "name": "Bob",
      "lastMessage": "Are you coming today?",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
      "time": "11:45 AM",
      "isUnread": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              ),

              // Tab Bar
              TabBar(
                labelColor: AppColors.primary,
                dividerColor: AppColors.fieldColor,
                unselectedLabelColor: AppColors.textGrey,
                indicatorColor: AppColors.primary,
                labelStyle:
                    GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('All'),
                        const SizedBox(width: 6),
                        _buildCounter(
                            readMessages.length + unreadMessages.length),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Unread'),
                        const SizedBox(width: 6),
                        _buildCounter(unreadMessages.length),
                      ],
                    ),
                  ),
                ],
              ),

              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    _buildChatList([...unreadMessages, ...readMessages]),
                    _buildChatList(unreadMessages),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget _buildChatList(List<Map<String, dynamic>> messages) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final bool isUnread = msg['isUnread'] ?? false;

        return Container(
          color: isUnread
              ? AppColors.primary.withOpacity(0.08)
              : Colors.transparent,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Stack(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 32.5, // half of the width and height (65/2)
                      backgroundColor: AppColors.fieldColor,
                      child: Icon(
                        Icons.person,
                        color: AppColors.primary,
                        size: 30,
                      ),
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
                          child: Image.asset(
                            "assets/images/nurse.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isUnread)
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            title: Text(
              msg['name'],
              style: GoogleFonts.plusJakartaSans(
                fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              msg['lastMessage'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: isUnread ? AppColors.black : AppColors.textGrey,
              ),
            ),
            trailing: Text(
              msg['time'],
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: AppColors.textGrey,
              ),
            ),
          ),
        );
      },
    );
  }
}
