import 'package:get/get.dart';

import 'package:veritey/pages/all_chats/all_chat_controller.dart';

class AllChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllChatController>(
      () => AllChatController(),
    );
  }
}
