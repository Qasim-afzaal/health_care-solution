import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/chat_page/tabs/chat.dart';
import 'package:veritey/pages/chat_page/tabs/detail.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirmed Booking",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      "Bino",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.call),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Chat'),
                  Tab(text: 'Detail'),
                ],
                labelColor: AppColors.primary,
                dividerColor: AppColors.fieldColor,
                unselectedLabelColor: AppColors.textGrey,
                indicatorColor: AppColors.primary,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const ChatScreenTab(),
                  DetailSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
