import 'package:flutter/material.dart';

/// A sliver widget that adds a gap of the specified size.
///
/// The [SliverGap] widget creates a sliver that contains a box with the given
/// width and height, effectively creating a gap or spacing in a sliver list.
///
/// The [gap] parameter specifies the size of the gap in logical pixels.
///
/// Example usage:
/// ```dart
/// SliverList(
///   delegate: SliverChildListDelegate([
///     Text('Item 1'),
///     SliverGap(16.0), // Adds a gap of 16 logical pixels
///     Text('Item 2'),
///   ]),
/// )
/// ```
///
/// See also:
///  * [SliverToBoxAdapter], which allows for arbitrary box widgets in slivers.
///  * [SizedBox], which is used to create the gap.
class SliverGap extends StatelessWidget {
  const SliverGap(this.gap, {super.key});

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(width: gap, height: gap));
  }
}
