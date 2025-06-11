import 'dart:convert';

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/login/login_response.dart';
import 'package:veritey/pages/home/model/home_model.dart';

class HomeController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  LoginResponse? mainModel;
  Dashboard? dashboardData;
  String? currentAddress;
  void setSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    update();
  }

  RxString country = "".obs;
  RxString address = "".obs;
  RxBool isLoading = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      mainModel = Get.arguments[HttpUtil.loginModel] ?? "";
    }
    fetchDashboardData();
    super.onInit();
  }

  void updateLatLng(double lat, double lng) {
    latitude.value = lat;
    longitude.value = lng;
    print(latitude.value);
    print(longitude.value);
  }

  void updateAddress(String newAddress) {
    address.value = newAddress;

    update();
  }

  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    try {
      final data = await APIFunction().apiCall(
        isLoading: false,
        isGet: true,
        apiName: "/appointment/dashboard",
      );

      dashboardData = Dashboard.fromJson(data);
      update();
    } catch (e) {
      utils.showSnackBar(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onAddress() async {
    isLoading.value = true;
    var json = {
      HttpUtil.latitude: double.parse(latitude.value.toString()),
      HttpUtil.longitude: double.parse(longitude.value.toString()),
      HttpUtil.address: address.value,
    };

    try {
      final data = await APIFunction().patchApiCall(
        isLoading: false,
        apiName: "/location",
        withOutFormData: jsonEncode(json),
      );

      mainModel = LoginResponse.fromJson(data);
      print(mainModel!.data!.location!.address);
      print(mainModel!.data!.username);

      if (mainModel!.success!) {
        getStorageData.saveLoginData(mainModel!);
        address.value =
            getStorageData.readLoginData().data?.location?.address ?? "";

        update();
        Get.back();
      } else {
        utils.showSnackBar(message: mainModel!.message!);
      }
    } catch (e) {
      utils.showSnackBar(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
