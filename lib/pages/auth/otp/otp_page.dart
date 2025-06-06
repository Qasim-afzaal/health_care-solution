import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/auth/otp/otp_page_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OtpPageController>(
          init: OtpPageController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    "OTP Verification",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Enter the OTP sent to +1(000) 000-0000.',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.textGrey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PHONE);
                        },
                        child: const Icon(
                          Icons.edit_note_sharp,
                          size: 26,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(3),
                      fieldHeight: 48,
                      fieldWidth: 79.75,
                      activeColor: AppColors.primary,
                      inactiveColor: Colors.grey[300]!,
                      selectedColor: AppColors.primary,
                      borderWidth: 1,
                    ),
                    onChanged: (value) {
                      controller.onOtpChanged(value);
                    },
                    appContext: context,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Row(
                            children: [
                              Text(
                                'Resend code in',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${controller.timer.value}',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          )),
                      // You can add attempts logic here if needed.
                      Row(
                        children: [
                          Text(
                            'attempts',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.textGrey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '0/10',
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
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'Need a new code?',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: AppColors.textGrey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Obx(() => GestureDetector(
                            // Only trigger resend if enabled.
                            onTap: controller.isResendEnabled.value
                                ? controller.resendCode
                                : null,
                            child: Text(
                              'Resend',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                // Change color based on whether resend is enabled.
                                color: controller.isResendEnabled.value
                                    ? AppColors.blueCard
                                    : Colors.grey,
                              ),
                            ),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Obx(() => AppButton.primary(
                        onPressed: controller.isOtpValid.value == false
                            ? () {
                                Get.toNamed(Routes.OTP_SIGNIN);
                              }
                            : null,
                        background: controller.isOtpValid.value == false
                            ? AppColors.fieldColor
                            : AppColors.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Verify Code",
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.backgroundColor),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.arrow_forward,
                                color: Colors.white, size: 18),
                          ],
                        ),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
