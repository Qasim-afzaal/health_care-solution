import 'package:get/get.dart';

import 'package:veritey/pages/schedule/schedule_page_controller.dart';

class SchedulePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulePageController>(
      () => SchedulePageController(),
    );
  }
}
