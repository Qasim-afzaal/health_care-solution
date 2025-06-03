import 'package:get/get.dart';

import 'package:veritey/pages/auth/enable_permission/enable_location_permission_controller.dart';

class EnableLocationPermissionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnableLocationPermissionController>(
      () => EnableLocationPermissionController(),
    );
  }
}
