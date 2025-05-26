import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/auth/select_address/select_address_screen_controller.dart';

class AddManualAddresssBottomSheet extends StatefulWidget {
  final bool isEmpty;
  final VoidCallback onClose;

  const AddManualAddresssBottomSheet({
    super.key,
    required this.isEmpty,
    required this.onClose,
  });

  @override
  State<AddManualAddresssBottomSheet> createState() =>
      _AddManualAddresssBottomSheetState();
}

class _AddManualAddresssBottomSheetState
    extends State<AddManualAddresssBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SelectAddressScreenController addressController =
      Get.put(SelectAddressScreenController());
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: addressController.address.value);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SizedBox(
        height: screenHeight * 0.77,
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
                        "Address",
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
                        ? ""
                        : "",
                    getPlaceDetailWithLatLng: (prediction) {
                      final lat = double.tryParse(prediction.lat ?? '');
                      final lng = double.tryParse(prediction.lng ?? '');

                      if (lat != null && lng != null) {
                        debugPrint("Latitude: $lat, Longitude: $lng");

                        // You can now use lat/lng in your controller or state
                        addressController.updateLatLng(lat, lng);
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
                      "US", "NG",
                      "PK",

                      // "GB", // United Kingdom
                      // "DE", // Germany
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
                      addressController.updateAddress(prediction.description!);

                      Future.delayed(const Duration(milliseconds: 200), () {
                        if (mounted) {
                          Get.back();
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1.0, color: AppColors.fieldColor),
                  TextButton(
                    onPressed: addressController.getCurrentLocation,
                    child: Row(
                      children: [
                        Image.asset("assets/images/Vector.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Can’t find your address?",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              "Use map to find",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
