import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreenController extends GetxController {
  var isLocationGranted = false.obs;

  Future<void> checkLocationPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      isLocationGranted.value = true;
    } else if (status.isPermanentlyDenied) {
      isLocationGranted.value = false;
      showSettingsDialog();
    } else {
      isLocationGranted.value = false;
    }
  }

  void showSettingsDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Permission Required"),
        content: const Text(
            "Location permission is permanently denied. Please enable it from app settings."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Get.back(); // Close dialog
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }
}
