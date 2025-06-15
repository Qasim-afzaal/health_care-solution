import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/medical_care/medical_care_controller.dart';

class MedicalCareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalCareController>(
      () => MedicalCareController(),
    );
  }
}
