import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/app_globals.dart';
import 'package:veritey/core/constants/app_strings.dart';
import 'package:veritey/core/constants/constants.dart';
import 'package:veritey/models/error_response.dart';
import 'package:veritey/pages/auth/login/login_response.dart';
import 'package:veritey/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool rememberMe = false; // Added remember me state
  String? errorMessage;

  Future<bool> login() async {
    isLoading = true;
    update();

    await Future.delayed(const Duration(seconds: 2)); // Simulating API call

    isLoading = false;
    update();

    return true; // Change based on actual login logic
  }

  void toggleRememberMe(bool value) {
    rememberMe = value;
    update();
  }

  // final _auth = FirebaseAuth.instance;
  LoginResponse? mainModel;
  RxBool areFieldsFilled = false.obs;
  @override
  void onInit() {
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);

    super.onInit();
  }

  void _checkFields() {
    areFieldsFilled.value =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void handleNavigation() {
    if (getStorageData.readLoginData().data!.location == null) {
      Get.offNamed(Routes.LOCATION_SCREEN);
    } else {
      Get.offNamed(Routes.DASHBOARD, arguments: {
        HttpUtil.loginModel: mainModel,
      });
    }
  }

  Future<void> onLogin() async {
    if (isLoginValidation()) {
      var json = {
        HttpUtil.email: emailController.text.trim(),
        // HttpUtil.password: "Password@123",
        HttpUtil.password: passwordController.text.trim(),
      };

      final data = await APIFunction().apiCall(
        apiName: "auth/login",
        withOutFormData: jsonEncode(json),
      );

      try {
        mainModel = LoginResponse.fromJson(data);

        AppGlobals.email = emailController.text;

        if (mainModel!.success!) {
          getStorageData.saveLoginData(mainModel!);
          handleNavigation();
        } else {
          utils.showSnackBar(message: mainModel!.message!);
        }
      } catch (e) {
        ErrorResponse errorModel = ErrorResponse.fromJson(data);

        utils.showSnackBar(message: errorModel.message!);
      }
    }
  }

  void navigateToSignup() {
    Get.offNamed(Routes.ON_BOARDING);
  }

  bool isLoginValidation() {
    utils.hideKeyboard();
    if (utils.isValidationEmpty(emailController.text)) {
      utils.showToast(message: AppStrings.errorEmail);
      return false;
    } else if (!utils.emailValidator(emailController.text)) {
      utils.showToast(message: AppStrings.errorValidEmail);
      return false;
    } else if (utils.isValidationEmpty(passwordController.text)) {
      utils.showToast(message: AppStrings.errorEmptyPassword);
      return false;
    }
    return true;
  }
}
