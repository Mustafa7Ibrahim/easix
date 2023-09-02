import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///
extension TimeOfDayExtension on TimeOfDay {
  /// format As H:I:S method day of time
  String toHIS() {
    final currentTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hour,
      minute,
    );

    return DateFormat('HH:mm:ss').format(currentTime);
  }
}
