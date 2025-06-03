import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/routes/app_pages.dart';

import 'enable_location_permission_controller.dart';

class EnableLocationPermissionScreen extends StatelessWidget {
  const EnableLocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EnableLocationPermissionController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.offNamed(Routes.LOCATION_SCREEN);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.back,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Base Icon.png",
                      scale: 1.8,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Your location",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Update your settings to “always” or “while using” to update your location",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.gry,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AppButton.primary(
                      title: "Go to Settings",
                      onPressed: controller.requestLocationPermission,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.LOCATION_SCREEN);
                      },
                      child: Text(
                        "No thanks",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const SizedBox();
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
