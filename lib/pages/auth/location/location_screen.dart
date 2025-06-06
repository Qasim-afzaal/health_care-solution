import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/auth/location/location_screen_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LocationScreenController>(
          init: LocationScreenController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.LOGIN);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.back,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/location.png",
                        scale: 1.3,
                      ),
                    ),
                    const SizedBox(height: 29),
                    Text(
                      "Enable Location",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You’ll need to enable your location for us \nto find you better results of daycare \nnearby you.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.gry,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton.primary(
                        title: "Enable Location",
                        onPressed: () {
                          Get.toNamed(Routes.LOCATION_PERMISSION_SCREEN);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton.outline(
                        title: "Enter Manually",
                        onPressed: () {
                          Get.toNamed(Routes.LOCATION_SCREEN2);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
