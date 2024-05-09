extension StringInitials on String {
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
}
