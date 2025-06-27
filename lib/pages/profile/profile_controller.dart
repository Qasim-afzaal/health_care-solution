import 'package:dio/dio.dart' as dio;

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/api_repository/api_function.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/login/login_response.dart';

class ProfileController extends GetxController {
  LoginResponse? mainModel;
  String? imagePath;

  @override
  void onInit() {
    if (Get.arguments != null) {
      mainModel = Get.arguments[HttpUtil.loginModel] ?? "";
    }
    super.onInit();
  }

  Future<void> uploadImage() async {
    try {
      if (imagePath == null) return;

      dio.FormData formData = dio.FormData.fromMap({
        HttpUtil.profileImageUrl: await dio.MultipartFile.fromFile(
          imagePath!,
          filename: imagePath!.split("/").last,
        ),
      });

      final data = await APIFunction().patchApiCall(
        apiName: "/users/profile-image",
        data: formData,
      );
      if (data["success"] == true) {
        mainModel = LoginResponse.fromJson(data);
        if (mainModel != null) {
          getStorageData.saveLoginData(mainModel!);
          update();
        }
      }
    } catch (e) {
      utils.showToast(message: "Image upload failed: $e");
    }
  }
}
