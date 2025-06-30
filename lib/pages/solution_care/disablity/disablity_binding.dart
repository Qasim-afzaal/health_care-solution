import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/disablity/disablity_controller.dart';

class DisablityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisablityController>(
      () => DisablityController(),
    );
  }
}
