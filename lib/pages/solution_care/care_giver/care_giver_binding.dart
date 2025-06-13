import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/care_giver/care_giver_controller.dart';

class CareGiverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CareGiverController>(
      () => CareGiverController(),
    );
  }
}
