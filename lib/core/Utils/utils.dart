import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:veritey/core/constants/app_colors.dart';

class Utils {
  changeStatusBarColor() {
    return SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  String formatAppointmentDate(String? dateString) {
    if (dateString == null) return '';

    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));
      final inputDate = DateTime(date.year, date.month, date.day);

      if (inputDate == today) {
        return 'Today';
      } else if (inputDate == tomorrow) {
        return 'Tomorrow';
      } else {
        return DateFormat('EEE, d MMM').format(date);
      }
    } catch (e) {
      return dateString;
    }
  }

  String formatAppointmentTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return '';

    try {
      final time = DateFormat("HH:mm:ss").parse(timeString);
      return DateFormat("h:mm a").format(time);
    } catch (e) {
      return timeString;
    }
  }

  Color getCategoryContainerColor(String category) {
    switch (category) {
      case "Mental Health Support":
        return AppColors.greenCard.withOpacity(0.1);
      case "Home Health & Elder Care":
        return AppColors.blueCard.withOpacity(0.1);
      case "Medical Care Coordination":
        return AppColors.orangeCard.withOpacity(0.1);
      case "Caregiver Support":
        return AppColors.red.withOpacity(0.1);
      default:
        return AppColors.purpleColor.withOpacity(0.2);
    }
  }

  Color getCategoryBorderColor(String category) {
    switch (category) {
      case "Mental Health Support":
        return AppColors.primary;
      case "Home Health & Elder Care":
        return AppColors.blueCard.withOpacity(0.2);
      case "Medical Care Coordination":
        return AppColors.orangeCard.withOpacity(0.2);
      case "Caregiver Support":
        return AppColors.pinkColor.withOpacity(0.2);
      default:
        return AppColors.purpleColor.withOpacity(0.2);
    }
  }

  String getCategoryImage(catogory) {
    switch (catogory) {
      case "Mental Health Support":
        return "assets/images/neuro.png";
      case "Home Health & Elder Care":
        return "assets/images/hospital.png";
      case "Medical Care Coordination":
        return "assets/images/binocullar.png";
      case "Caregiver Support":
        return "assets/images/care_giver.png";
      default:
        return "assets/images/nurse.png";
    }
  }
}
