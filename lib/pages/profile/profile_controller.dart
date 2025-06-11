import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/login/login_response.dart';

class ProfileController extends GetxController {
  LoginResponse? mainModel;

  @override
  void onInit() {
    if (Get.arguments != null) {
      mainModel = Get.arguments[HttpUtil.loginModel] ?? "";
    }
    super.onInit();
  }
}
