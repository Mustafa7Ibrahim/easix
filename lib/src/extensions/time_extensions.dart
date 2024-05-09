import 'package:intl/intl.dart';

/// convert time from 12:55:00 to 12:55 PM or 12:55 AM based on the time
/// using extension on date time
extension ToTime on String {
  /// convert time from 12:55:00 to 12:55 PM or 12:55 AM based on the time
  String to12Time({bool showMeridian = true}) {
    final time = DateTime.parse('2021-01-01 $this');
    final formattedTime = DateFormat.jm().format(time);
    if (showMeridian) {
      return formattedTime;
    } else {
      return formattedTime.replaceAll('AM', '').replaceAll('PM', '');
    }
  }
}
