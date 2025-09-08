import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Extension for formatting DateTime objects
extension DateTimeFormatExtensions on DateTime {
  /// Format as yyyy-MM-dd
  ///
  /// Example: DateTime(2025, 9, 8) → "2025-09-08"
  String toYMD() => DateFormat('yyyy-MM-dd').format(this);

  /// Format as yyyy/MM/dd
  ///
  /// Example: DateTime(2025, 9, 8) → "2025/09/08"
  String toYMDWithSlash() => DateFormat('yyyy/MM/dd').format(this);

  /// Format as dd-MM-yyyy
  ///
  /// Example: DateTime(2025, 9, 8) → "08-09-2025"
  String toDMY() => DateFormat('dd-MM-yyyy').format(this);

  /// Format as dd/MM/yyyy
  ///
  /// Example: DateTime(2025, 9, 8) → "08/09/2025"
  String toDMYWithSlash() => DateFormat('dd/MM/yyyy').format(this);

  /// Format as yyyy-MM-dd HH:mm:ss
  ///
  /// Example: DateTime(2025, 9, 8, 14, 30, 45) → "2025-09-08 14:30:45"
  String toFullDateTime() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  /// Format as HH:mm
  ///
  /// Example: DateTime(2025, 9, 8, 14, 30, 45) → "14:30"
  String toHM() => DateFormat('HH:mm').format(this);

  /// Format as HH:mm:ss
  ///
  /// Example: DateTime(2025, 9, 8, 14, 30, 45) → "14:30:45"
  String toHMS() => DateFormat('HH:mm:ss').format(this);

  /// Format as EEE, MMM d, yyyy (e.g., Mon, Sep 8, 2025)
  ///
  /// Example: DateTime(2025, 9, 8) → "Mon, Sep 8, 2025"
  String toShortWeekdayMonthDayYear() =>
      DateFormat('EEE, MMM d, yyyy').format(this);

  /// Format as MMM d, yyyy (e.g., Sep 8, 2025)
  ///
  /// Example: DateTime(2025, 9, 8) → "Sep 8, 2025"
  String toMonthDayYear() => DateFormat('MMM d, yyyy').format(this);

  /// Format as yyyyMMdd (e.g., 20250908)
  ///
  /// Example: DateTime(2025, 9, 8) → "20250908"
  String toCompactYMD() => DateFormat('yyyyMMdd').format(this);

  /// Format as yyyy-MM-ddTHH:mm:ss (ISO 8601 without timezone)
  ///
  /// Example: DateTime(2025, 9, 8, 14, 30, 45) → "2025-09-08T14:30:45"
  String toIsoLike() => DateFormat('yyyy-MM-ddTHH:mm:ss').format(this);

  /// Format as yyyy-MM-dd HH:mm (no seconds)
  ///
  /// Example: DateTime(2025, 9, 8, 14, 30, 45) → "2025-09-08 14:30"
  String toYMDHM() => DateFormat('yyyy-MM-dd HH:mm').format(this);

  /// Format as MMMM d, yyyy (e.g., September 8, 2025)
  ///
  /// Example: DateTime(2025, 9, 8) → "September 8, 2025"
  String toLongMonthDayYear() => DateFormat('MMMM d, yyyy').format(this);

  /// Format as EEEE, MMMM d, yyyy (e.g., Monday, September 8, 2025)
  ///
  /// Example: DateTime(2025, 9, 8) → "Monday, September 8, 2025"
  String toFullWeekdayMonthDayYear() =>
      DateFormat('EEEE, MMMM d, yyyy').format(this);

  /// Format as MM/dd/yyyy (US format)
  ///
  /// Example: DateTime(2025, 9, 8) → "09/08/2025"
  String toUSDate() => DateFormat('MM/dd/yyyy').format(this);

  /// Format as MM-dd-yyyy (US format with dashes)
  ///
  /// Example: DateTime(2025, 9, 8) → "09-08-2025"
  String toUSDateWithDashes() => DateFormat('MM-dd-yyyy').format(this);

  /// Format as dd.MM.yyyy (European format)
  ///
  /// Example: DateTime(2025, 9, 8) → "08.09.2025"
  String toEuropeanDate() => DateFormat('dd.MM.yyyy').format(this);

  /// Format as MMM dd, yyyy (Medium date format)
  ///
  /// Example: DateTime(2025, 9, 8) → "Sep 08, 2025"
  String toMediumDate() => DateFormat('MMM dd, yyyy').format(this);

  /// Format as h:mm a (12-hour without seconds)
  ///
  /// Example: DateTime(2025, 9, 8, 14, 30, 45) → "2:30 PM"
  String to12HourTime() => DateFormat('h:mm a').format(this);

  /// Format as relative time (e.g., "2 days ago", "in 3 hours")
  ///
  /// Example: DateTime.now().subtract(Duration(days: 2)) → "2 days ago"
  String toRelativeTime() {
    final now = DateTime.now();

    if (isAfter(now)) {
      final diff = difference(now);
      if (diff.inMinutes < 1) return 'in a moment';
      if (diff.inHours < 1) return 'in ${diff.inMinutes} minutes';
      if (diff.inDays < 1) return 'in ${diff.inHours} hours';
      if (diff.inDays < 7) return 'in ${diff.inDays} days';
      if (diff.inDays < 30) return 'in ${(diff.inDays / 7).round()} weeks';
      if (diff.inDays < 365) return 'in ${(diff.inDays / 30).round()} months';
      return 'in ${(diff.inDays / 365).round()} years';
    } else {
      final diff = now.difference(this);
      if (diff.inMinutes < 1) return 'just now';
      if (diff.inHours < 1) return '${diff.inMinutes} minutes ago';
      if (diff.inDays < 1) return '${diff.inHours} hours ago';
      if (diff.inDays < 7) return '${diff.inDays} days ago';
      if (diff.inDays < 30) return '${(diff.inDays / 7).round()} weeks ago';
      if (diff.inDays < 365) return '${(diff.inDays / 30).round()} months ago';
      return '${(diff.inDays / 365).round()} years ago';
    }
  }

  /// Format as time ago (simplified relative time)
  ///
  /// Example: DateTime.now().subtract(Duration(hours: 2)) → "2h"
  String toTimeAgo() {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inDays > 0) return '${diff.inDays}d';
    if (diff.inHours > 0) return '${diff.inHours}h';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m';
    return 'now';
  }

  /// Format as weekday name
  ///
  /// Example: DateTime(2025, 9, 8) → "Monday"
  String toWeekdayName() => DateFormat('EEEE').format(this);

  /// Format as short weekday name
  ///
  /// Example: DateTime(2025, 9, 8) → "Mon"
  String toShortWeekdayName() => DateFormat('EEE').format(this);

  /// Format as month name
  ///
  /// Example: DateTime(2025, 9, 8) → "September"
  String toMonthName() => DateFormat('MMMM').format(this);

  /// Format as short month name
  ///
  /// Example: DateTime(2025, 9, 8) → "Sep"
  String toShortMonthName() => DateFormat('MMM').format(this);

  /// Format as ordinal day (e.g., 1st, 2nd, 3rd, 4th)
  ///
  /// Example: DateTime(2025, 9, 8) → "8th"
  String toOrdinalDay() {
    final day = this.day;
    if (day >= 11 && day <= 13) return '${day}th';
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  /// Format as chat timestamp (today: HH:mm, yesterday: Yesterday, older: MMM d)
  ///
  /// Example: Today → "14:30", Yesterday → "Yesterday", Older → "Sep 6"
  String toChatTimestamp() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final thisDate = DateTime(year, month, day);

    if (thisDate == today) {
      return DateFormat('HH:mm').format(this);
    } else if (thisDate == yesterday) {
      return 'Yesterday';
    } else if (year == now.year) {
      return DateFormat('MMM d').format(this);
    } else {
      return DateFormat('MMM d, y').format(this);
    }
  }
}

/// Extension for formatting TimeOfDay objects
extension TimeOfDayFormatExtensions on TimeOfDay {
  /// Format as HH:mm:ss
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → "14:30:00"
  String toHIS() {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat('HH:mm:ss').format(currentTime);
  }

  /// Format as HH:mm
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → "14:30"
  String toHM() {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat('HH:mm').format(currentTime);
  }

  /// Format as h:mm a (12-hour format with AM/PM)
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → "2:30 PM"
  String to12Hour() {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat('h:mm a').format(currentTime);
  }

  /// Format as h:mm:ss a (12-hour format with seconds and AM/PM)
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → "2:30:00 PM"
  String to12HourWithSeconds() {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat('h:mm:ss a').format(currentTime);
  }

  /// Format as HHmm (e.g., 1430)
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → "1430"
  String toCompactHM() {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat('HHmm').format(currentTime);
  }

  /// Format as HH:mm 'o''clock' (e.g., 14:30 o'clock)
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → "14:30 o'clock"
  String toOClock() {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return "${DateFormat('HH:mm').format(currentTime)} o'clock";
  }

  /// Convert to DateTime with current date
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30) → DateTime with today's date and specified time
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  /// Convert to DateTime with specific date
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).toDateTimeWithDate(DateTime(2025, 9, 8)) → DateTime(2025, 9, 8, 14, 30)
  DateTime toDateTimeWithDate(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  /// Check if time is AM
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).isAM → false
  bool get isAM => hour < 12;

  /// Check if time is PM
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).isPM → true
  bool get isPM => hour >= 12;

  /// Get period (AM/PM)
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).period → "PM"
  String get period => hour < 12 ? 'AM' : 'PM';

  /// Add minutes to time
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).addMinutes(45) → TimeOfDay(hour: 15, minute: 15)
  TimeOfDay addMinutes(int minutes) {
    final dateTime = toDateTime().add(Duration(minutes: minutes));
    return TimeOfDay.fromDateTime(dateTime);
  }

  /// Subtract minutes from time
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).subtractMinutes(45) → TimeOfDay(hour: 13, minute: 45)
  TimeOfDay subtractMinutes(int minutes) {
    final dateTime = toDateTime().subtract(Duration(minutes: minutes));
    return TimeOfDay.fromDateTime(dateTime);
  }

  /// Check if time is between two times
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).isBetween(TimeOfDay(hour: 12, minute: 0), TimeOfDay(hour: 18, minute: 0)) → true
  bool isBetween(TimeOfDay start, TimeOfDay end) {
    final current = hour * 60 + minute;
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;

    if (startMinutes <= endMinutes) {
      return current >= startMinutes && current <= endMinutes;
    } else {
      // Handle overnight periods (e.g., 22:00 to 06:00)
      return current >= startMinutes || current <= endMinutes;
    }
  }

  /// Get total minutes since midnight
  ///
  /// Example: TimeOfDay(hour: 14, minute: 30).totalMinutes → 870
  int get totalMinutes => hour * 60 + minute;

  /// Format as time remaining until this time today
  ///
  /// Example: TimeOfDay(hour: 18, minute: 0) when current time is 14:30 → "3h 30m"
  String toTimeRemaining() {
    final now = TimeOfDay.now();
    final currentMinutes = now.hour * 60 + now.minute;
    final targetMinutes = hour * 60 + minute;

    int diff = targetMinutes - currentMinutes;
    if (diff < 0) diff += 24 * 60; // Next day

    final hours = diff ~/ 60;
    final minutes = diff % 60;

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else if (minutes > 0) {
      return '${minutes}m';
    } else {
      return 'now';
    }
  }
}
