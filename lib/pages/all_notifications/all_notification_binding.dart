import 'package:get/get.dart';

import 'package:veritey/pages/all_notifications/all_notification_controller.dart';

class AllNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllNotificationController>(
      () => AllNotificationController(),
    );
  }
}
