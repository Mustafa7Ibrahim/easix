import 'package:intl/intl.dart';

enum DateDisplayType { full, short }

enum DateDisplayLanguage { en, ar }

extension ToHumanDate on DateTime {
  String toHumanDate({
    DateDisplayType displayType = DateDisplayType.short,
    DateDisplayLanguage language = DateDisplayLanguage.en,
  }) {
    final now = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    );

    final difference = now.difference(this).abs();
    final isFuture = isAfter(now);

    if (isFuture) {
      if (difference.inDays >= 7) {
        return DateFormat(
                displayType == DateDisplayType.full ? 'MMM d, y' : 'MMM d')
            .format(this);
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
            .format(this);
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
