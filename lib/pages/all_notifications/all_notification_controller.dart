import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/all_notifications/model/all_notification_model.dart';

class AllNotificationController extends GetxController {
  NotificationResponse? notificationResponse;
  RxBool isLoading = false.obs;

  Future<void> fetchNotifcationData() async {
    try {
      final data = await APIFunction().apiCall(
        isLoading: true,
        isGet: true,
        apiName: "/notifications",
      );

      notificationResponse = NotificationResponse.fromJson(data);
      update();
    } catch (e) {
      utils.showSnackBar(message: e.toString());
    } finally {}
  }

  Future<void> markAsRead(String id) async {
    isLoading.value = true;

    try {
      final data = await APIFunction().patchApiCall(
        apiName: "notifications/mark-read/$id",
        withOutFormData: null,
      );

      if (data != null && data['success'] == true) {
        await fetchNotifcationData();
      } else {
        utils.showSnackBar(
            message: data['message'] ?? "Failed to mark as read");
      }
    } catch (e) {
      utils.showSnackBar(message: "Error marking notification as read");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchNotifcationData();
    super.onInit();
  }
}
