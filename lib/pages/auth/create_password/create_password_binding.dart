import 'package:get/get.dart';

import 'package:veritey/pages/auth/create_password/create_password_controller.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePasswordController>(
      () => CreatePasswordController(),
    );
  }
}
