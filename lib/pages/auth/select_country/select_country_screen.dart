import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/routes/app_pages.dart';

import 'select_country_screen_controller.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectCountryScreenController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
                    "Select your Country",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller.searchController,
                onChanged: controller.filterCountries,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon:
                      const Icon(Icons.search, color: AppColors.textGrey),
                  filled: true,
                  fillColor: AppColors.greyColor,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Obx(() {
                if (controller.filteredCountryList.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.filteredCountryList.length,
                  itemBuilder: (context, index) {
                    final country = controller.filteredCountryList[index];
                    return GestureDetector(
                      onTap: () => controller.selectCountry(country),
                      child: ListTile(
                        title: Text(
                          country.name,
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://flagcdn.com/w160/${country.countryCode.toLowerCase()}.png",
                            width: 43,
                            height: 32,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Text(
                              country.flagEmoji,
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        trailing: Obx(() => Radio<String>(
                              value: country.name,
                              groupValue:
                                  controller.selectedCountry.value?.name,
                              activeColor: AppColors.primary,
                              onChanged: (value) =>
                                  controller.selectCountry(country),
                            )),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton.primary(
                    onPressed: controller.selectedCountry.value == null ||
                            controller.selectedCountry.value == ""
                        ? null
                        : () {
                            print(
                                "Selected Country: ${controller.selectedCountry.value}");
                            controller.navigate();
                          },
                    background: controller.selectedCountry.value == null
                        ? AppColors.fieldColor
                        : AppColors.primary,
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
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
