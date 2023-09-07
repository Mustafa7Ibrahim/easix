import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

/// DateMode enum for [toHumanDate] extension
/// it has two values [full] and [short]
/// [full] is for full date format like: 'MMM d, y' - September 19, 2023
/// [short] is for short date format like: 'MMM d' - September 19
enum DateMode { full, short }

/// DateLang enum for [toHumanDate] extension
/// it has two values [en] and [ar]
/// [en] is for English language
/// [ar] is for Arabic language
enum DateLang { en, ar }

extension ToHumanDate on DateTime {
  /// Convert DateTime to human readable date
  /// [displayType] is for date format, it has two values [full] and [short]
  /// [full] is for full date format like: 'MMM d, y' - September 19, 2023
  /// [short] is for short date format like: 'MMM d' - September 19
  /// [language] is for language, it has two values [en] and [ar]
  /// [en] is for English language
  /// [ar] is for Arabic language
  /// example:
  /// ```dart
  /// DateTime.now().toHumanDate();
  /// ```
  /// output:
  /// ```dart
  /// Just now
  /// ```
  ///
  String toHumanDate({
    DateMode displayType = DateMode.short,
    DateLang language = DateLang.en,
  }) {
    initializeDateFormatting('ae-MA', null);
    final now = DateTime.now();
    final difference = now.difference(this).abs();
    final isFuture = isAfter(now);

    if (isFuture) {
      if (difference.inDays == 1) {
        if (language == DateLang.ar) {
          return 'غدًا';
        }
        return 'Tomorrow';
      } else if (difference.inDays >= 2) {
        final formattedDate = language == DateLang.ar
            ? _formatArabicDate(this, displayType)
            : DateFormat(
                displayType == DateMode.full ? 'MMM d, y' : 'MMM d',
              ).format(this);
        return formattedDate;
      } else if (difference.inHours >= 1) {
        if (language == DateLang.ar) {
          return 'بعد ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
        }
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} from now';
      } else if (difference.inMinutes >= 1) {
        if (language == DateLang.ar) {
          return 'بعد ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
        }
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} from now';
      } else {
        if (language == DateLang.ar) {
          return 'الآن';
        }
        return 'Just now';
      }
    } else {
      if (difference.inDays == 1) {
        if (language == DateLang.ar) {
          return 'أمس';
        }
        return 'Yesterday';
      } else if (difference.inDays >= 2) {
        final formattedDate = language == DateLang.ar
            ? _formatArabicDate(this, displayType)
            : DateFormat(
                displayType == DateMode.full ? 'MMM d, y' : 'MMM d',
              ).format(this);
        return formattedDate;
      } else if (difference.inHours >= 1) {
        if (language == DateLang.ar) {
          return 'منذ ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
        }
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
      } else if (difference.inMinutes >= 1) {
        if (language == DateLang.ar) {
          return 'منذ ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
        }
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
      } else {
        if (language == DateLang.ar) {
          return 'الآن';
        }
        return 'Just now';
      }
    }
  }

  String _formatArabicDate(DateTime date, DateMode displayType) {
    var arabicFormat = DateFormat('MMMM d', 'ar_MA');
    if (displayType == DateMode.full) {
      arabicFormat = DateFormat('y MMMM d', 'ar_MA');
    }

    String formattedDate = arabicFormat.format(date);

    // Map Arabic digits to English digits
    const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
    const englishDigits = '0123456789';

    for (int i = 0; i < arabicDigits.length; i++) {
      formattedDate =
          formattedDate.replaceAll(arabicDigits[i], englishDigits[i]);
    }

    // Wrap English digits with LTR embedding marks
    formattedDate = formattedDate.replaceAllMapped(
        RegExp(r'[0-9]'), (match) => '\u202A${match.group(0)}\u202C');

    return formattedDate;
  }
}
