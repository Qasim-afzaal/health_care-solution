import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/home/home_controller.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({
    super.key,
  });

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomeController homeController = Get.put(HomeController());
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: homeController.address.value);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final viewInsets = MediaQuery.of(context).viewInsets;
    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: screenHeight * 0.50,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                        child: SizedBox(
                          width: 32,
                          child: Divider(
                            thickness: 3.0,
                            color: AppColors.fieldColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Update Address",
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GooglePlaceAutoCompleteTextField(
                      textEditingController: textController,
                      googleAPIKey: Platform.isAndroid
                          ? "AIzaSyCmvyvZVBBPKogOY7d2U33oGjgvXhjrcPA"
                          : "AIzaSyCmvyvZVBBPKogOY7d2U33oGjgvXhjrcPA",
                      getPlaceDetailWithLatLng: (prediction) {
                        final lat = double.tryParse(prediction.lat ?? '');
                        final lng = double.tryParse(prediction.lng ?? '');

                        if (lat != null && lng != null) {
                          debugPrint("Latitude: $lat, Longitude: $lng");

                          homeController.updateLatLng(lat, lng);
                        }
                      },
                      inputDecoration: InputDecoration(
                        hintText: 'Enter the Address',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                        suffixIcon: const SizedBox.shrink(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                      ),
                      debounceTime: 300,
                      countries: const [
                        "US",
                        "NG",
                        "PK",
                        "GB", // United Kingdom
                        "DE", // Germany
                        // "FR", // France
                        // "IT", // Italy
                        // "ES", // Spain
                        // "NL", // Netherlands
                        // "SE", // Sweden
                        // "NO", // Norway
                        // "FI", // Finland
                        // "DK", // Denmark
                        // "PL", // Poland
                        // "BE", // Belgium
                        // "PT", // Portugal
                        // "GR", // Greece
                        // "CH", // Switzerland
                        // "AT", // Austria
                        // "IE", // Ireland
                        // "CZ", // Czech Republic
                      ],
                      isLatLngRequired: true,
                      itemClick: (prediction) {
                        textController.text = prediction.description ?? '';
                        homeController.address.value =
                            prediction.description ?? '';
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 1.0, color: AppColors.fieldColor),
                    Obx(() {
                      if (homeController.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14),
                            ),
                            onPressed: () async {
                              if (textController.text.isNotEmpty) {
                                homeController.address.value =
                                    textController.text;
                                await homeController.onAddress();
                              } else {
                                utils.showSnackBar(
                                    message: "Please enter an address.");
                              }
                            },
                            child: Text(
                              "Update Address",
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
