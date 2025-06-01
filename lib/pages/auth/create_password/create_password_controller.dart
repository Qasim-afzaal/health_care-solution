import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/constants.dart';
import 'package:veritey/core/constants/get_storage.dart';

class CreatePasswordController extends GetxController {
  // Text controllers
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> changePassword() async {
    final currentPassword = currentPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      utils.showSnackBar(message: "Passwords do not match.");
      return;
    }

    final json = {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    };

    try {
      final data = await APIFunction().patchApiCall(
        isLoading: true,
        token: GetStorageData().readLoginData().data?.accessToken,
        apiName: "users/change-password",
        withOutFormData: jsonEncode(json),
      );
      print(data["success"]);
      if (data["success"] == true) {
        print("i am here");

        Get.back();
        utils.showSnackBar(
            statusCode: 1, message: "Password changed successfully.");
      } else {
        utils.showSnackBar(message: data["message"] ?? "Something went wrong.");
      }
    } catch (e) {
      utils.showSnackBar(message: e.toString());
    } finally {}
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
