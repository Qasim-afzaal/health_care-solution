import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/routes/app_pages.dart';

import '../../../core/constants/app_colors.dart';

class EnableLocationPermissionController extends GetxController {
  RxString country = "".obs;
  RxString address = "".obs;
  RxBool isLoading = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  void showLocationPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 329,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/Base Icon.png",
                    scale: 1.8,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Your location",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Update your settings to “always” or “while using” to update your location",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.gry,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton.primary(
                    title: "Go to Settings",
                    onPressed: requestLocationPermission,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.LOCATION_SCREEN);
                  },
                  child: Text(
                    "No thanks",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      bool opened = await Geolocator.openAppSettings();
      if (!opened) {
        await Geolocator.openLocationSettings();
      }
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      await getCurrentLocation();
    }
  }
}
