import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/routes/app_pages.dart';

class LocationOptionsScreenController extends GetxController {
  RxString country = "".obs;
  RxString address = "".obs;
  RxBool isLoading = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  Future<void> getCurrentLocation() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Error", "Location services are disabled.");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Error", "Location permission denied.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("Error", "Location permissions are permanently denied.");
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      debugPrint(
          "Current Location: ${position.latitude}, ${position.longitude}");
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        throw Exception("No address found");
      }

      Placemark place = placemarks.first;
      address.value = "${place.street}, ${place.locality}";
      country.value = place.country ?? "";

      Get.toNamed(Routes.SELECTED_ADDRESS, arguments: {
        HttpUtil.country: country.value,
        HttpUtil.address: address.value,
        HttpUtil.latitude: latitude.value,
        HttpUtil.longitude: longitude.value,
      });
    } catch (e) {
      debugPrint("Error fetching address: $e");
      Get.snackbar("Error", "Failed to get location: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
