import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/components/app_text_field.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/app_strings.dart';
import 'package:veritey/pages/auth/create_password/create_password_controller.dart';

class CreatePasswordPage extends StatelessWidget {
  CreatePasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePasswordController>(
      init: CreatePasswordController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  CupertinoIcons.back,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Change Password",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Create New Password",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Your New password must be different from current password",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.textGrey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: controller.currentPasswordController,
                            title: "Current Password",
                            hintTextColor: Colors.grey,
                            hintText: AppStrings.enterPassword,
                            textInputAction: TextInputAction.done,
                            isPasswordField: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: controller.newPasswordController,
                            title: "New Password",
                            hintTextColor: Colors.grey,
                            hintText: "Enter your new password",
                            textInputAction: TextInputAction.done,
                            isPasswordField: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: controller.confirmPasswordController,
                            title: "Re-enter Password",
                            hintTextColor: Colors.grey,
                            hintText: "Re-enter your password",
                            textInputAction: TextInputAction.done,
                            isPasswordField: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please re-enter your password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 6 characters long';
                              }
                              if (value !=
                                  controller.newPasswordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          AppButton.primary(
                              title: "Update Password",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.changePassword();
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
