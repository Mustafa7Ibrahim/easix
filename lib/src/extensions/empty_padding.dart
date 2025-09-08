import 'package:flutter/material.dart';

/// This method is used to add extension on num to add a sized box with height
/// and width.
extension EmptyPadding on num {
  /// This method is to add a sized box with height
  @Deprecated('Use Gap And Sliver Gap Widgets Instead')
  SizedBox get ph => SizedBox(height: toDouble());

  /// This method is to add a sized box with width.
  @Deprecated('Use Gap And Sliver Gap Widgets Instead')
  SizedBox get pw => SizedBox(width: toDouble());

  /// This method is to add a sized box with height and width.
  @Deprecated('Use Gap And Sliver Gap Widgets Instead')
  SizedBox get p => SizedBox(width: toDouble(), height: toDouble());
}
