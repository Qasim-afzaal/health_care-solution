import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/mental_health/mental_health_controller.dart';

class MentalHealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentalHealthController>(
      () => MentalHealthController(),
    );
  }
}
