import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/home_health/home_health_controller.dart';

class HomeHealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeHealthController>(
      () => HomeHealthController(),
    );
  }
}
