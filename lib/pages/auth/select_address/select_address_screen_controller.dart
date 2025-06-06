import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/login/login_response.dart';
import 'package:veritey/routes/app_pages.dart';

class SelectAddressScreenController extends GetxController {
  RxString country = "".obs;
  RxString address = "".obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  LoginResponse? mainModel;
  @override
  void onInit() {
    if (Get.arguments != null) {
      country.value = Get.arguments[HttpUtil.country] ?? "";
      address.value = Get.arguments[HttpUtil.address] ?? "";
      latitude.value = Get.arguments[HttpUtil.latitude] ?? 0.0;
      longitude.value = Get.arguments[HttpUtil.longitude] ?? 0.0;
      addressController.text = address.value;
      countryController.text = country.value;
    }
    super.onInit();
  }

  void updateLatLng(double lat, double lng) {
    latitude.value = lat;
    longitude.value = lng;
    print(latitude.value);
    print(longitude.value);
  }

  void handleNavigation() {
    if (getStorageData.readLoginData().data!.location == null) {
      Get.offNamed(Routes.SELECTED_ADDRESS);
    } else {
      Get.offNamed(Routes.DASHBOARD, arguments: {
        HttpUtil.loginModel: mainModel,
      });
    }
  }

  void updateAddress(String newAddress) {
    address.value = newAddress;
    addressController.text = newAddress;
    update();
  }

  void updateCountry(String newCountry) {
    country.value = newCountry;
    countryController.text = newCountry;
  }

  bool get isButtonEnabled => country.isNotEmpty && address.isNotEmpty;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyCmvyvZVBBPKogOY7d2U33oGjgvXhjrcPA';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final results = data['results'];
          if (results.isNotEmpty) {
            final formattedAddress = results[0]['formatted_address'];
            final addressComponents = results[0]['address_components'];

            String countryName = "";
            for (var component in addressComponents) {
              if (component['types'].contains('country')) {
                countryName = component['long_name'];
                break;
              }
            }

            address.value = formattedAddress;
            country.value = countryName;
            addressController.text = formattedAddress;
            countryController.text = countryName;

            update();
            Get.back();
          }
        }
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> onAddress() async {
    // if (isUpdateValidation()) {
    var json = {
      HttpUtil.latitude: double.parse(latitude.value.toString()),
      HttpUtil.longitude: double.parse(longitude.value.toString()),
      HttpUtil.address: address.value,
    };

    Get.toNamed(Routes.CREATE_ACCOUNT);

    try {
      final data = await APIFunction().apiCall(
        isLoading: false,
        apiName: "/location",
        withOutFormData: jsonEncode(json),
      );

      mainModel = LoginResponse.fromJson(data);

      if (mainModel!.success!) {
        getStorageData.saveLoginData(mainModel!);
        handleNavigation();
      } else {
        utils.showSnackBar(message: mainModel!.message!);
        Get.offNamed(Routes.SELECTED_ADDRESS);
      }
    } catch (e) {
      utils.showSnackBar(message: e.toString());
      Get.offNamed(Routes.SELECTED_ADDRESS); // failure: go to SELECTED_ADDRESS
    }
    // }
  }

  bool isUpdateValidation() {
    utils.hideKeyboard();
    if (!utils.isValidationEmpty(addressController.text)) {
      utils.showToast(message: "Field cannot be empty");
      return false;
    } else if (utils.isValidationEmpty(countryController.text)) {
      utils.showToast(message: "Field cannot be empty");
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    addressController.dispose();
    countryController.dispose();
    super.onClose();
  }
}
