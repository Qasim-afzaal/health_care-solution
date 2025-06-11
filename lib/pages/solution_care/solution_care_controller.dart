import 'dart:convert';

import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/models/error_response.dart';
import 'package:veritey/pages/home/home_controller.dart';
import 'package:veritey/pages/schedule/schedule_page_controller.dart';
import 'package:veritey/pages/solution_care/model/appointment_model.dart';
import 'package:veritey/pages/solution_care/model/solution_care_model.dart';
import 'package:veritey/routes/app_pages.dart';

final SchedulePageController scheduleController =
    Get.find<SchedulePageController>();
final HomeController homeController = Get.find<HomeController>();

class SolutionCareController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedTime = ''.obs;
  RxString selectedLocation = ''.obs;
  RxString id = "".obs;
  RxString appoointmentID = "".obs;
  RxString location = ''.obs;
  RxString date = ''.obs;
  RxString time = ''.obs;
  ServiceCategoriesResponse? serviceCategoriesResponse;
  BookingResponse? bookingResponse;
  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      final data = await APIFunction().apiCall(
        isLoading: false,
        isGet: true,
        apiName: "/appointment/categories",
      );

      serviceCategoriesResponse = ServiceCategoriesResponse.fromJson(data);

      update();
    } catch (e) {
      utils.showSnackBar(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> bookingAppointment() async {
    var json = {
      "date": selectedDate.value.toIso8601String().split('T')[0],
      "from_time": selectedTime.value,
      "address": selectedLocation.value,
      "categoryId": id.value
    };
    print(json);
    final data = await APIFunction().apiCall(
      apiName: "/appointment",
      isLoading: true,
      withOutFormData: jsonEncode(json),
    );

    try {
      bookingResponse = BookingResponse.fromJson(data);

      if (bookingResponse!.success) {
        scheduleController.fetchAppointments();
        homeController.fetchDashboardData();
        update();

        Get.offNamed(Routes.BOOKING_PAGE);
      } else {
        utils.showSnackBar(message: bookingResponse!.message);
      }
    } catch (e) {
      ErrorResponse errorModel = ErrorResponse.fromJson(data);

      utils.showSnackBar(message: errorModel.message!);
    }
  }

  Future<void> updateBookingAppointment() async {
    var json = {
      "date": selectedDate.value.toIso8601String().split('T')[0],
      "from_time": selectedTime.value,
      "address": selectedLocation.value,
    };
    print(json);
    final data = await APIFunction().patchApiCall(
      apiName: "/appointment/${appoointmentID.value}",
      isLoading: true,
      withOutFormData: jsonEncode(json),
    );

    try {
      bookingResponse = BookingResponse.fromJson(data);

      if (bookingResponse!.success) {
        scheduleController.fetchAppointments();
        homeController.fetchDashboardData();
        update();
        Get.back();
        utils.showSnackBar(
            statusCode: 1, message: "Appointment update successfully.");
      } else {
        utils.showSnackBar(message: bookingResponse!.message);
      }
    } catch (e) {
      ErrorResponse errorModel = ErrorResponse.fromJson(data);

      utils.showSnackBar(message: errorModel.message!);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
}
