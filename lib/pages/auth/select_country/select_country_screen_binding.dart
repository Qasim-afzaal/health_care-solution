import 'package:get/get.dart';

import 'package:veritey/pages/auth/select_country/select_country_screen_controller.dart';

class SelectCountryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCountryScreenController>(
      () => SelectCountryScreenController(),
    );
  }
}
