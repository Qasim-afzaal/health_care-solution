import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:veritey/api_repository/api_class.dart';
import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/pages/solution_care/components/services_card.dart';
import 'package:veritey/pages/solution_care/solution_care_controller.dart';
import 'package:veritey/routes/app_pages.dart';

class SolutionCare extends StatelessWidget {
  SolutionCare({super.key});

  final Map<String, dynamic> cardAssets = {
    'Home Health & Elder Care': {
      'imagePath': 'assets/images/hospital.png',
      'backgroundColor': 'assets/images/home_health_b.png',
    },
    'Mental Health Support': {
      'imagePath': 'assets/images/neuro.png',
      'backgroundColor': 'assets/images/mental_health_b.png',
    },
    'Medical Care Coordination': {
      'imagePath': 'assets/images/binocullar.png',
      'backgroundColor': 'assets/images/medical_care_b.png',
    },
    'Caregiver Support': {
      'imagePath': 'assets/images/care_giver.png',
      'backgroundColor': 'assets/images/care_giver_b.png',
    },
    'On Demand Nurse': {
      'imagePath': 'assets/images/nurse.png',
      'backgroundColor': 'assets/images/on_demand_b.png',
    },
  };

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - 30) / 2;

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SolutionCareController>(
          init: SolutionCareController(),
          builder: (controller) {
            return controller.isLoading.value
                ? Center(
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                      color: AppColors.primary,
                      size: 50,
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Request Service',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: controller.serviceCategoriesResponse?.data ==
                                    null ||
                                controller
                                    .serviceCategoriesResponse!.data.isEmpty
                            ? Center(
                                child: Text(
                                  'No services available.',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                              )
                            : SingleChildScrollView(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: controller
                                      .serviceCategoriesResponse!.data
                                      .map((service) {
                                    final assets =
                                        cardAssets[service.name] ?? {};
                                    return SizedBox(
                                      width: cardWidth,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.id.value = service.id;
                                          switch (service.name) {
                                            case 'Home Health & Elder Care':
                                              Get.toNamed(
                                                Routes.HOME_HEALTH,
                                                arguments: {
                                                  HttpUtil.id: service.id,
                                                },
                                              );

                                              break;
                                            case 'Mental Health Support':
                                              Get.toNamed(
                                                Routes.MENTAL_HEALTH,
                                                arguments: {
                                                  HttpUtil.id: service.id,
                                                },
                                              );
                                              break;
                                            case 'Medical Care Coordination':
                                              Get.toNamed(
                                                Routes.MEDICAL_CARE,
                                                arguments: {
                                                  HttpUtil.id: service.id,
                                                },
                                              );
                                              break;
                                            case 'Caregiver Support':
                                              Get.toNamed(
                                                Routes.CARE_GIVER,
                                                arguments: {
                                                  HttpUtil.id: service.id,
                                                },
                                              );
                                              break;
                                            case 'On Demand Nurse':
                                              Get.toNamed(
                                                Routes.ON_DEMAND,
                                                arguments: {
                                                  HttpUtil.id: service.id,
                                                },
                                              );
                                              break;
                                          }
                                        },
                                        child: CustomCard(
                                          imagePath: assets['imagePath'] ?? '',
                                          title: service.name,
                                          description: service.description,
                                          backgroundColor:
                                              assets['backgroundColor'] ?? '',
                                          textColor: Colors.white,
                                          borderColor:
                                              assets['backgroundColor'] ?? '',
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
