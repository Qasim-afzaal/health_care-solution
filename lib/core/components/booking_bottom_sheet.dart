import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/schedule/schedule_page_controller.dart';
import 'package:veritey/pages/solution_care/solution_care_controller.dart';

class BookingBottomSheet extends StatefulWidget {
  const BookingBottomSheet({super.key});

  @override
  _BookingBottomSheetState createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SolutionCareController solutionCareController =
      Get.put(SolutionCareController());
  final SchedulePageController schedulePageController =
      Get.put(SchedulePageController());

  DateTime selectedDate = DateTime.now();
  String selectedTime = '';

  @override
  void initState() {
    super.initState();
    solutionCareController.selectedDate.value = selectedDate;
    // solutionCareController.selectedLocation.value = selectedLocation;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SizedBox(
        height: screenHeight * 0.78,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking",
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
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter the Location',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 8.0),
                        child: Icon(Icons.place_outlined,
                            color: AppColors.primary),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
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
                    onChanged: (value) {
                      solutionCareController.selectedLocation.value = value;
                    },
                  ),

                  // GooglePlaceAutoCompleteTextField(
                  //   textEditingController: controller,
                  //   googleAPIKey: Platform.isAndroid
                  //       ? "AIzaSyCmvyvZVBBPKogOY7d2U33oGjgvXhjrcPA"
                  //       : "AIzaSyCmvyvZVBBPKogOY7d2U33oGjgvXhjrcPA",
                  //   inputDecoration: InputDecoration(
                  //     hintText: 'Enter the Location',
                  //     prefixIcon: const Padding(
                  //       padding: EdgeInsets.only(left: 12.0, right: 8.0),
                  //       child: Icon(Icons.place_outlined,
                  //           color: AppColors.primary),
                  //     ),
                  //     prefixIconConstraints: const BoxConstraints(
                  //       minWidth: 40,
                  //       minHeight: 40,
                  //     ),
                  //     suffixIcon: const SizedBox.shrink(),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12.0),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12.0),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     contentPadding: const EdgeInsets.symmetric(
                  //       vertical: 12.0,
                  //       horizontal: 16.0,
                  //     ),
                  //   ),
                  //   debounceTime: 300,
                  //   countries: const [
                  //     "US", "NG",
                  //     "PK",

                  //     // "GB", // United Kingdom
                  //     // "DE", // Germany
                  //     // "FR", // France
                  //     // "IT", // Italy
                  //     // "ES", // Spain
                  //     // "NL", // Netherlands
                  //     // "SE", // Sweden
                  //     // "NO", // Norway
                  //     // "FI", // Finland
                  //     // "DK", // Denmark
                  //     // "PL", // Poland
                  //     // "BE", // Belgium
                  //     // "PT", // Portugal
                  //     // "GR", // Greece
                  //     // "CH", // Switzerland
                  //     // "AT", // Austria
                  //     // "IE", // Ireland
                  //     // "CZ", // Czech Republic
                  //   ],
                  //   isLatLngRequired: true,
                  //   itemClick: (prediction) {
                  //     controller.text = prediction!.description!;
                  //     solutionCareController.selectedLocation.value =
                  //         prediction!.description!;
                  //   },
                  // ),

                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: _selectDate,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16.5,
                              backgroundColor: AppColors.fieldColor,
                              child: Icon(Icons.calendar_month,
                                  color: AppColors.primary, size: 19),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Choose Date',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColors.black,
                                    )),
                                const SizedBox(height: 8),
                                Text(
                                  '${selectedDate.toLocal()}'.split(' ')[0],
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(CupertinoIcons.forward)
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Choose Time',
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.black,
                          )),
                      const SizedBox(height: 16),
                      _buildTimeCategory('Morning',
                          ['9:00 AM', '9:30 AM', '10:00 AM'], screenWidth),
                      _buildTimeCategory('Afternoon',
                          ['12:00 PM', '12:30 PM', '1:00 PM'], screenWidth),
                      _buildTimeCategory('Evening',
                          ['4:00 PM', '4:30 PM', '5:00 PM'], screenWidth),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: AppColors.fieldColor),
                  const SizedBox(height: 10),
                  AppButton.primary(
                    onPressed: () {
                      final location = controller.text;
                      final time = selectedTime;

                      if (location.isEmpty) {
                        Get.snackbar('Error', 'Please select a location',
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }

                      if (time.isEmpty) {
                        Get.snackbar('Error', 'Please select a time',
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }

                      solutionCareController.selectedDate.value = selectedDate;
                      solutionCareController.selectedTime.value = selectedTime;

                      solutionCareController.bookingAppointment();
                    },
                    background: AppColors.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book an Appointment",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.backgroundColor,
                            )),
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

  Widget _buildTimeCategory(
      String label, List<String> slots, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.black,
            )),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: slots.map((slot) => _timeSlot(slot, screenWidth)).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _timeSlot(String time, double screenWidth) {
    double totalSpacing = 8 * 2;
    double slotWidth = (screenWidth - 40 - totalSpacing) / 3;
    bool isSelected = selectedTime == time;

    return SizedBox(
      width: slotWidth,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTime = time;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.fieldColor),
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? AppColors.primary : Colors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            time,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: isSelected ? Colors.white : AppColors.textGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _selectDate() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
