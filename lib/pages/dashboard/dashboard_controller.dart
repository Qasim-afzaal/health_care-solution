import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/core/notifcations/notfication_controller.dart';

class DashBoardController extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeNaveIndex(int? index) {
    if (index != null) {
      _currentIndex = index;
      update();
    }
  }

  void viewAll(int? index) {
    if (index != null) {
      _currentIndex = 1;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    Get.put(NotificationController());
  }
}
