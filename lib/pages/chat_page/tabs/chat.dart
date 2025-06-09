import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';

class ChatScreenTab extends StatefulWidget {
  const ChatScreenTab({super.key});

  @override
  State<ChatScreenTab> createState() => _ChatScreenTabState();
}

class _ChatScreenTabState extends State<ChatScreenTab> {
  final List<Map<String, dynamic>> messages = [
    {
      'message': "Hello! How are you feeling today?",
      'sender': "Qasim",
      'time': "10:00 AM",
      'isSender': true,
    },
    {
      'message': "I'm feeling a bit anxious.",
      'sender': "Ali",
      'time': "10:01 AM",
      'isSender': false,
    },
    {
      'message': "That's okay, it's normal. Let's talk about it.",
      'sender': "Qasim",
      'time': "10:02 AM",
      'isSender': true,
    },
  ];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {});

      print('Picked image path: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Stack(
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
                      child: Image.asset("assets/images/nurse.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Qasim",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "Mental Health Support",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.textGrey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(color: AppColors.fieldColor),
          ),

          // Static Chat UI
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isSender = msg['isSender'] as bool;
                final alignment = isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start;

                return Column(
                  crossAxisAlignment: alignment,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: isSender
                            ? const Color.fromARGB(70, 47, 150, 235)
                            : const Color(0xFFE6F6F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            msg['sender'],
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg['message'],
                            style: GoogleFonts.plusJakartaSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 2),
                      child: Text(
                        msg['time'],
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          color: AppColors.textGrey,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type...",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            const BorderSide(color: AppColors.fieldColor),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(CupertinoIcons.camera,
                            color: Colors.black45),
                        onPressed: () {
                          _pickImageFromGallery();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // handle send/add click
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF54A89E),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
