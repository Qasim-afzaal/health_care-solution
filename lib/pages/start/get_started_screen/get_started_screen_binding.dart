import 'package:get/get.dart';

import 'package:veritey/pages/start/get_started_screen/get_started_screen_controller.dart';

class GetStartedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartedScreenController>(
      () => GetStartedScreenController(),
    );
  }
}
