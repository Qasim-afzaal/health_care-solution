import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/constants.dart';
import 'package:veritey/core/constants/get_storage.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/home/home_controller.dart';
import 'package:veritey/pages/schedule/model/appointment_model.dart';

final HomeController homeController = Get.find<HomeController>();

class SchedulePageController extends GetxController {
  RxBool isLoading = false.obs;
  AppointmentsResponse? appointmentsResponse;

  Future<void> fetchAppointments() async {
    isLoading.value = true;
    try {
      final data = await APIFunction().apiCall(
        isLoading: false,
        isGet: true,
        apiName: "/appointment/grouped/status",
      );

      appointmentsResponse = AppointmentsResponse.fromJson(data);
      update();
    } catch (e) {
      utils.showSnackBar(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> cancelApi(String id) async {
    try {
      print(id);
      final data = await APIFunction().patchApiCall(
          isLoading: true,
          token: GetStorageData().readLoginData().data?.accessToken,
          apiName: "/appointment/cancel/${id}",
          withOutFormData: {"reason": "User canceled manually"});
      print(data["success"]);
      if (data["success"] == true) {
        await fetchAppointments();
        homeController.fetchDashboardData();
        utils.showSnackBar(
            statusCode: 1, message: "Appointment Cancel successfully.");
      } else {
        utils.showSnackBar(message: data["message"] ?? "Something went wrong.");
      }
    } catch (e) {
      print(e);
      utils.showSnackBar(message: e.toString());
    } finally {}
  }

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }
}
