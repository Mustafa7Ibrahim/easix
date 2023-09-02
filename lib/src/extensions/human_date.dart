import 'package:intl/intl.dart';

/// ToHumanDate extension on DateTime class
/// to convert DateTime to human readable date
extension ToHumanDate on DateTime {
  /// toHumanDate method to convert DateTime to human readable date
  String toHumanDate() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays >= 7) {
      return DateFormat('MMM d ' 'at' ' h:mm a').format(this);
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
