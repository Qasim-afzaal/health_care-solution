import 'package:get/get.dart';

import 'package:veritey/pages/solution_care/on_demand/on_demand_controller.dart';

class OnDemandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnDemandController>(
      () => OnDemandController(),
    );
  }
}
