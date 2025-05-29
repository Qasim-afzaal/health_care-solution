import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

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
}
