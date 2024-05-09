import 'package:flutter/material.dart';

/// an extension to check time of the day
extension TimeOfDayExtensions on TimeOfDay {
  /// if time is before or equal to other time
  bool isBefore(TimeOfDay other) {
    if (hour < other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute < other.minute;
    } else {
      return false;
    }
  }

  /// if time is after or equal to other time
  bool isAfter(TimeOfDay other) {
    if (hour > other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute > other.minute;
    } else {
      return false;
    }
  }

  /// Extension method to calculate the difference between two TimeOfDay objects
  int differenceInMinutes(TimeOfDay other) {
    final hourDifference = other.hour - hour;
    final minuteDifference = other.minute - minute;
    return hourDifference * 60 + minuteDifference;
  }

  /// Extension method to check if a TimeOfDay is between two others
  bool isBetween(TimeOfDay start, TimeOfDay end) {
    final currentTimeInMinutes = hour * 60 + minute;
    final startTimeInMinutes = start.hour * 60 + start.minute;
    final endTimeInMinutes = end.hour * 60 + end.minute;

    return currentTimeInMinutes >= startTimeInMinutes &&
        currentTimeInMinutes <= endTimeInMinutes;
  }
}
