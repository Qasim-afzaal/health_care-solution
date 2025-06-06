import 'package:get/get.dart';

import 'package:veritey/pages/auth/phone/phone_controller.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneController>(
      () => PhoneController(),
    );
  }
}
