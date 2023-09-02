import 'package:intl/intl.dart';

/// custom time display extension on DateTime
extension YMDExtension on DateTime {
  /// formatAsYMD method to format date as yyyy-MM-dd
  String toYMD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
