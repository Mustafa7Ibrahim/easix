import 'package:flutter/material.dart';

/// This method is used to add extension on num to add a sized box with height
/// and width.
extension EmptyPadding on num {
  /// This method is to add a sized box with height
  SizedBox get ph => SizedBox(height: toDouble());

  /// This method is to add a sized box with width.
  SizedBox get pw => SizedBox(width: toDouble());

  /// This method is to add a sized box with height and width.
  SizedBox get p => SizedBox(width: toDouble(), height: toDouble());
}
