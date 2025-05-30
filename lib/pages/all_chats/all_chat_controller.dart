import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllChatController extends GetxController {
  List<String> readMessages = ['Message 1', 'Message 2', 'Message 3'];
  List<String> unreadMessages = ['Message A', 'Message B'];

  @override
  void onInit() {
    super.onInit();
    // Normally you'd load data from an API or database here
  }
}
