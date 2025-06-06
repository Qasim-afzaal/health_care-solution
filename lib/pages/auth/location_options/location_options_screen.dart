import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:veritey/core/components/selection_bottom_sheet.dart';
import 'package:veritey/pages/auth/location_options/location_options_screen_controller.dart';

class LocationOptionsScreen extends StatefulWidget {
  const LocationOptionsScreen({super.key});

  @override
  State<LocationOptionsScreen> createState() => _LocationOptionsScreenState();
}

class _LocationOptionsScreenState extends State<LocationOptionsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAddFolderBottomSheet();
    });
  }

  void _showAddFolderBottomSheet() {
    TextEditingController textController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AddNewFolderBottomSheet(textEditingController: textController),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LocationOptionsScreenController>(
          init: LocationOptionsScreenController(),
          builder: (controller) {
            return Container();
          },
        ),
      ),
    );
  }
}
