import 'package:get/get.dart';

import 'package:veritey/pages/dashboard/dashboard_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    );
  }
}
