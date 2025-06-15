import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/core/constants/imports.dart';

class MentalHealthController extends GetxController {
  String? id;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      id = Get.arguments[HttpUtil.id] ?? "";
    }
  }
}
