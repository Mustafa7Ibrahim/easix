import 'package:flutter/material.dart';

extension StringEx on String {
  /// Get initials from a string
  /// example:
  /// ```dart
  /// 'John Doe'.initials;
  /// ```
  /// output:
  /// ```dart
  /// JD
  /// ```
  ///
  String get initials {
    List<String> nameParts = trim().split(' ');
    if (nameParts.length < 2) {
      return nameParts.first.substring(0, 1);
    }
    return nameParts.first.trim()[0] + nameParts.last.trim()[0];
  }

  /// Get initial from a string
  /// example:
  /// ```dart
  /// 'John Doe'.initial;
  /// ```
  /// output:
  /// ```dart
  /// J
  /// ```
  ///
  String get initial {
    return trim().substring(0, 1);
  }

  /// Converts a hex color string to a [Color] object.
  ///
  /// The hex color string can be in the format `#RRGGBB` or `#AARRGGBB`.
  /// If the string is in the `#RRGGBB` format, the opacity is set to `FF` by default.
  ///
  /// Throws a [FormatException] if the string is not in a valid hex color format.
  ///
  /// Example:
  /// ```dart
  /// Color color1 = "#FF5733".toColor(); // Color with default opacity
  /// Color color2 = "#80FF5733".toColor(); // Color with specified opacity
  /// ```
  Color toColor() {
    final hexCode = replaceAll("#", "");
    if (hexCode.length == 6) {
      return Color(int.parse("FF$hexCode", radix: 16));
    } else if (hexCode.length == 8) {
      return Color(int.parse(hexCode, radix: 16));
    } else {
      throw const FormatException(
        "Invalid hex color format. Use '#RRGGBB' or '#AARRGGBB'.",
      );
    }
  }
}
