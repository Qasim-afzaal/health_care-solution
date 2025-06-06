import 'package:flutter/material.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/auth/phone/phone_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PhoneController>(
          init: PhoneController(),
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
                    "Phone Number",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Phone Number",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          CountryCode? selected =
                              await showModalBottomSheet<CountryCode>(
                            context: context,
                            builder: (BuildContext context) {
                              final List<CountryCode> countryList = [
                                CountryCode(
                                    name: "United States",
                                    code: "US",
                                    dialCode: "+1"),
                                CountryCode(
                                    name: "United Kingdom",
                                    code: "GB",
                                    dialCode: "+44"),
                                CountryCode(
                                    name: "Pakistan",
                                    code: "PK",
                                    dialCode: "+92"),
                              ];
                              return ListView.builder(
                                itemCount: countryList.length,
                                itemBuilder: (context, index) {
                                  final country = countryList[index];
                                  return ListTile(
                                    leading: Text(country.flagUri ?? ''),
                                    title: Text(country.name ?? ''),
                                    trailing: Text(country.dialCode ?? ''),
                                    onTap: () {
                                      Navigator.pop(context, country);
                                    },
                                  );
                                },
                              );
                            },
                          );
                          if (selected != null) {
                            controller.updateCountryCode(selected);
                          }
                        },
                        child: CountryCodePicker(
                          onChanged: (code) {},
                          initialSelection: controller.selectedCountryCode.code,
                          favorite: const ['+1', 'US', 'PK'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          showDropDownButton: false,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Enter phone number",
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            controller.phoneNumber = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  AppButton.primary(
                    title: "Change",
                    onPressed: () {
                      Get.toNamed(Routes.OTP_SIGNIN);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
