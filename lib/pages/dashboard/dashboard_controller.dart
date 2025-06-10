import 'package:veritey/core/constants/imports.dart';

class DashBoardController extends GetxController {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void changeNaveIndex(int? index) {
    if (index != null) {
      _currentIndex = index;
      update();
    }
  }
}
