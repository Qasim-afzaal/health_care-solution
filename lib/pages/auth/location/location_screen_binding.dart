import 'package:get/get.dart';

import 'package:veritey/pages/auth/location/location_screen_controller.dart';

class LocationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationScreenController>(
      () => LocationScreenController(),
    );
  }
}
