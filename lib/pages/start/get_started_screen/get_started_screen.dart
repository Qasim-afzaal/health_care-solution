import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/start/get_started_screen/get_started_screen_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetStartedScreenController>(
          init: GetStartedScreenController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/images/veritey.png",
                    scale: 3,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        "assets/images/onboard_image.png",
                        scale: 2.5,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Text(
                      "Welcome to Care Solution",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Find the right care provider, manage\n appointments, and access support tailored\n to your needs.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton.primary(
                    title: "Get Started",
                    onPressed: () {
                      Get.offNamed(Routes.LOGIN);
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
