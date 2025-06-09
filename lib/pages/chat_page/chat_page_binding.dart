import 'package:get/get.dart';

import 'package:veritey/pages/chat_page/chat_page_controller.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatScreenController>(
      () => ChatScreenController(),
    );
  }
}
