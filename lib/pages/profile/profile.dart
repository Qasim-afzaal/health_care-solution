import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/logout_dialog.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/home/home_controller.dart';
import 'package:veritey/pages/profile/component/logout_android_dialog.dart';
import 'package:veritey/pages/profile/profile_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Profile',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE_DETAIL);
                      },
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
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: AppColors.fieldColor,
                                    child: controller.mainModel?.data
                                                    ?.profileImage !=
                                                null &&
                                            controller.mainModel!.data!
                                                .profileImage!.isNotEmpty
                                        ? ClipOval(
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.network(
                                                  controller.mainModel!.data!
                                                      .profileImage!,
                                                  width: 44, // 2 * radius
                                                  height: 44,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return const SizedBox(
                                                      width: 16,
                                                      height: 16,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      const Icon(
                                                    Icons.person,
                                                    color: AppColors.primary,
                                                    size: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const Icon(Icons.person,
                                            color: AppColors.primary, size: 30),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        controller.mainModel?.data?.username ??
                                            "",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        'Company name',
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
                              const Icon(
                                CupertinoIcons.forward,
                                size: 19,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/mail.png",
                              scale: 1.3,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  controller.mainModel?.data?.email ?? "",
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
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      color: AppColors.fieldColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/pin_black.png",
                              scale: 1.3,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  (controller.mainModel?.data?.location
                                                  ?.locationAddress?.length ??
                                              0) >
                                          30
                                      ? '${controller.mainModel?.data?.location?.locationAddress?.substring(0, 30)}...'
                                      : controller.mainModel?.data?.location
                                              ?.locationAddress ??
                                          "",
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
                        const Icon(
                          CupertinoIcons.forward,
                          size: 19,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      color: AppColors.fieldColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/appoint.png",
                              scale: 1.3,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Past Appointments',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  '12 appointments',
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
                        const Icon(
                          CupertinoIcons.forward,
                          size: 19,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      color: AppColors.fieldColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.CREATE_PASSWORD);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/lock.png",
                                scale: 1.3,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Change Password',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Icon(
                            CupertinoIcons.forward,
                            size: 19,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      color: AppColors.fieldColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/headphone.png",
                              scale: 1.3,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Care Solution Support',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(
                          CupertinoIcons.forward,
                          size: 19,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      color: AppColors.fieldColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        showLogoutDialog(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign Out',
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (_) => const LogoutDialogCupertino(),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => const LogoutDialog(),
      );
    }
  }
}
