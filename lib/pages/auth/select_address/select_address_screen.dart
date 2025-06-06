import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/address_bottom_sheet.dart';
import 'package:veritey/core/components/app_text_field.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/select_address/select_address_screen_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SelectAddressScreenController>(
          init: SelectAddressScreenController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.offNamed(Routes.LOCATION_SCREEN),
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 30,
                          color: AppColors.textGrey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Add New Address",
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: controller.countryController,
                    title: "Country",
                    hintText: "Enter your country",
                    hintTextColor: const Color(0XFF6B6F80),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.addressController,
                    title: "Address",
                    hintText: "Enter your address",
                    hintTextColor: const Color(0XFF6B6F80),
                    onChange: (value) {
                      controller.updateAddress(value);
                    },
                    suffixIcon:
                        const Icon(Icons.search, color: AppColors.primary),
                    onTap: () => _showAddressBottomSheet(context, controller),
                  ),
                  const Spacer(),
                  AppButton.primary(
                    onPressed: controller.isButtonEnabled
                        ? () async {
                            await controller.onAddress();
                          }
                        : null,
                    background: controller.isButtonEnabled
                        ? AppColors.primary
                        : AppColors.fieldColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.arrow_forward,
                            color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 29),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAddressBottomSheet(
      BuildContext context, SelectAddressScreenController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddManualAddresssBottomSheet(
        isEmpty: controller.addressController.text.isEmpty,
        onClose: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
