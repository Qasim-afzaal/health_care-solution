import 'dart:async';

import 'package:get/get.dart';

class OtpPageController extends GetxController {
  RxInt timer = 32.obs;
  Timer? _countdownTimer;

  RxBool isResendEnabled = false.obs;

  RxBool isOtpValid = false.obs;

  void startTimer() {
    timer.value = 32;
    isResendEnabled.value = false;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timer.value > 0) {
        timer.value--;
      } else {
        isResendEnabled.value = true;
        t.cancel();
      }
    });
  }

  void resendCode() {
    if (isResendEnabled.value) {
      startTimer();
    }
  }

  void onOtpChanged(String otp) {
    isOtpValid.value = otp.length == 4;
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _countdownTimer?.cancel();
    super.onClose();
  }
}
