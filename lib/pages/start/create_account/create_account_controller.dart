import 'package:get/get.dart';

import 'package:veritey/routes/app_pages.dart';

import '../../../core/enums/genders.dart';
import '../../../core/enums/personality.dart';

class CreateAccountController extends GetxController {
  Genders? gender;
  String? ageRange;
  Personality? personalityType;

  createAccount() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.DASHBOARD);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
