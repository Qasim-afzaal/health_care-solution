import 'package:get/get.dart';

import 'package:veritey/pages/auth/location_options/location_options_screen_controller.dart';

class LocationOptionsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationOptionsScreenController>(
      () => LocationOptionsScreenController(),
    );
  }
}
