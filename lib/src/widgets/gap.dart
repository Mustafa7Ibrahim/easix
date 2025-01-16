import 'package:flutter/material.dart';

/// A widget that creates a gap of the specified size in both height and width.
///
/// The [Gap] widget is useful for adding spacing between other widgets in a
/// layout. It takes a single [gap] parameter which determines the size of the
/// gap in logical pixels.
///
/// Example usage:
/// ```dart
/// Row(
///   children: [
///     Text('Item 1'),
///     Gap(10.0),
///     Text('Item 2'),
///   ],
/// )
/// ```
///
/// This will create a horizontal gap of 10 logical pixels between the two text
/// widgets.
///
/// See also:
///  * [SizedBox], which can be used to create fixed-size boxes in layouts.
class Gap extends StatelessWidget {
  const Gap(this.gap, {super.key});

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap, width: gap);
  }
}
