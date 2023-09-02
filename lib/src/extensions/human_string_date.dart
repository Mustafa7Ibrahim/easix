import 'package:intl/intl.dart';

/// ToHumanDate extension on String class
/// to convert String date to human readable date
extension ToHumanStringDate on String {
  /// toHumanDate method to convert String date to human readable date
  String toHumanStringDate() {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final dateTime = formatter.parse(this);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays >= 7) {
      return DateFormat('MMM d ' 'at' ' h:mm a').format(dateTime);
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}
