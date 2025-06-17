import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/routes/app_pages.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateAccountController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.offNamed(Routes.LOCATION_SCREEN),
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 30,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Center(
                            child: LoadingAnimationWidget.prograssiveDots(
                              color: AppColors.primary,
                              size: 50,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Please wait while we find the best Service Provider for you!, and access support tailored\n to your needs.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
