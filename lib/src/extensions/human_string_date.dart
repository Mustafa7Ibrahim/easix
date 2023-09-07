import 'package:easix/easix.dart';
import 'package:intl/intl.dart';

/// ToHumanDate extension on String class
/// to convert String date to human readable date
extension ToHumanStringDate on String {
  /// toHumanDate method to convert String date to human readable date
  String toHumanStringDate({
    DateDisplayType displayType = DateDisplayType.short,
    DateDisplayLanguage language = DateDisplayLanguage.en,
  }) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final dateTime = formatter.parse(this);
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final isFuture = dateTime.isAfter(now);

    if (isFuture) {
      if (difference.inDays >= 7) {
        return DateFormat(
                displayType == DateDisplayType.full ? 'MMM d, y' : 'MMM d')
            .format(dateTime);
      } else if (difference.inDays >= 1) {
        if (language == DateDisplayLanguage.ar) {
          return 'بعد ${difference.inDays} ${difference.inDays == 1 ? 'يوم' : 'أيام'}';
        }
        return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} from now';
      } else if (difference.inHours >= 1) {
        if (language == DateDisplayLanguage.ar) {
          return 'بعد ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
        }
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} from now';
      } else if (difference.inMinutes >= 1) {
        if (language == DateDisplayLanguage.ar) {
          return 'بعد ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
        }
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} from now';
      } else {
        if (language == DateDisplayLanguage.ar) {
          return 'الآن';
        }
        return 'Just now';
      }
    } else {
      if (difference.inDays >= 7) {
        return DateFormat(
                displayType == DateDisplayType.full ? 'MMM d, y' : 'MMM d')
            .format(dateTime);
      } else if (difference.inDays >= 1) {
        if (language == DateDisplayLanguage.ar) {
          return 'منذ${difference.inDays} ${difference.inDays == 1 ? 'يوم' : 'أيام'}';
        }
        return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
      } else if (difference.inHours >= 1) {
        if (language == DateDisplayLanguage.ar) {
          return 'منذ ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
        }
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
      } else if (difference.inMinutes >= 1) {
        if (language == DateDisplayLanguage.ar) {
          return 'منذ ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
        }
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
      } else {
        if (language == DateDisplayLanguage.ar) {
          return 'الآن';
        }
        return 'Just now';
      }
    }
  }
}
