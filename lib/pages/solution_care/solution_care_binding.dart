import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/solution_care_controller.dart';

class SolutionCareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SolutionCareController>(
      () => SolutionCareController(),
    );
  }
}
