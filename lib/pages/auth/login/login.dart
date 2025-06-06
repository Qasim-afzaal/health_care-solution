import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/core/components/app_button.dart';
import 'package:veritey/core/components/app_text_field.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/app_strings.dart';
import 'package:veritey/routes/app_pages.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.MAINPAGE);
                        },
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        "Sign In",
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Glad to see you back 👋",
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.gry,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: controller.emailController,
                        title: AppStrings.email,
                        hintTextColor: const Color(0XFF6B6F80),
                        hintText: AppStrings.enterEmail,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.passwordController,
                        title: AppStrings.password,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.rememberMe,
                                onChanged: (value) {
                                  controller.toggleRememberMe(value ?? false);
                                },
                                activeColor: AppColors.primary,
                                side: const BorderSide(
                                    color: AppColors.fieldColor),
                              ),
                              Text(
                                "Remember Me",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      AppButton.primary(
                        title: "Sign In",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // final connectivityResult =
                            //     await Connectivity().checkConnectivity();

                            // if (connectivityResult == ConnectivityResult.none) {
                            //   Get.snackbar(
                            //     'No Internet',
                            //     'Please check your internet connection.',
                            //     snackPosition: SnackPosition.BOTTOM,
                            //     backgroundColor: Colors.red,
                            //     colorText: Colors.white,
                            //   );
                            // } else {
                            await controller.onLogin();
                            // }
                          }
                        },
                      ),
                      if (controller.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            controller.errorMessage!,
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
