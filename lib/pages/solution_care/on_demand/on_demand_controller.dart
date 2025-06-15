import 'package:get/get.dart';

import 'package:veritey/api_repository/api_class.dart';

class OnDemandController extends GetxController {
  String? id;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      id = Get.arguments[HttpUtil.id] ?? "";
      print("this is id $id");
    }
  }
}
