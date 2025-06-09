import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/chat/chat_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatController homeController = Get.put(ChatController());
  bool _isSearching = false;
  String _searchQuery = '';

  final List<Map<String, dynamic>> messages = [
    {
      "name": "John Doe",
      "designation": "Software Engineer",
      "lastMessage": "Hey, how are you?",
      "imageUrl": "https://i.pravatar.cc/150?img=1",
      "time": "10:30 AM",
      "isUnread": false,
    },
    {
      "name": "Alice",
      "designation": "Product Manager",
      "lastMessage": "Let’s catch up later.",
      "imageUrl": "https://i.pravatar.cc/150?img=2",
      "time": "9:15 AM",
      "isUnread": false,
    },
    {
      "name": "Bob",
      "designation": "UX Designer",
      "lastMessage": "Are you coming today?",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
      "time": "11:45 AM",
      "isUnread": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: _isSearching
                          ? TextField(
                              key: const ValueKey('search'),
                              onChanged: (query) {
                                setState(() {
                                  _searchQuery = query;
                                });
                              },
                              autofocus: true,
                              style: const TextStyle(color: AppColors.black),
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle:
                                    const TextStyle(color: AppColors.textGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.fieldColor),
                                ),
                              ),
                            )
                          : Container(
                              key: const ValueKey('title'),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Chat",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isSearching
                          ? CupertinoIcons.clear_circled
                          : CupertinoIcons.search,
                      color: AppColors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                        if (!_isSearching) {
                          _searchQuery = '';
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 32.5,
                            backgroundColor: AppColors.fieldColor,
                            child: Icon(
                              Icons.person,
                              color: AppColors.primary,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Chat With Support',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                'How we can  Help You Today?',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final bool isUnread = msg['isUnread'] ?? false;

                  if (_searchQuery.isNotEmpty &&
                      !msg['name']
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase())) {
                    return Container();
                  }

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.CHAT_PAGE);
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 32.5,
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
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            msg['name'],
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight:
                                  isUnread ? FontWeight.bold : FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            msg['designation'] ?? "Mental Health Support",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        msg['lastMessage'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color:
                              isUnread ? AppColors.black : AppColors.textGrey,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                msg['time'],
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              if (isUnread)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    "1",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
