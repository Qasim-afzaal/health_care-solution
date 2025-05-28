import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/location_options/location_options_screen_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class AddNewFolderBottomSheet extends StatefulWidget {
  final TextEditingController textEditingController;
  final VoidCallback? onPressed;

  const AddNewFolderBottomSheet({
    super.key,
    required this.textEditingController,
    this.onPressed,
  });

  @override
  State<AddNewFolderBottomSheet> createState() =>
      _AddNewFolderBottomSheetState();
}

class _AddNewFolderBottomSheetState extends State<AddNewFolderBottomSheet> {
  final LocationOptionsScreenController locationController =
      Get.put(LocationOptionsScreenController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                child: SizedBox(
                  width: 32,
                  child: Divider(
                    thickness: 3.0,
                    color: AppColors.fieldColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => Get.offNamed(Routes.LOCATION_SCREEN),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: locationController.getCurrentLocation,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/pin.png",
                            scale: 2,
                          ),
                          const SizedBox(width: 13),
                          Text(
                            "Use my current location",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      if (locationController.isLoading.value)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.textGrey,
                          ),
                        )
                      else
                        const Icon(
                          CupertinoIcons.forward,
                          color: AppColors.textGrey,
                        ),
                    ],
                  )),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () => Get.offNamed(Routes.SELECTED_COUNTRY),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/plus.png",
                        scale: 1.4,
                      ),
                      const SizedBox(width: 13),
                      Text(
                        "Add New Address",
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.forward,
                    color: AppColors.textGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
