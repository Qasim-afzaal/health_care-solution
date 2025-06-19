import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                scale: 8,
              ),
            ),
          ),
        );
      },
    );
  }
}
