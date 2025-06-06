import 'package:get/get.dart';

import 'package:veritey/pages/auth/select_address/select_address_screen_controller.dart';

class SelectAddressScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectAddressScreenController>(
      () => SelectAddressScreenController(),
    );
  }
}
