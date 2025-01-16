import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';

/// A highly customizable image widget that supports displaying:
/// - Network images
/// - Local SVG files
/// - Remote SVG files
/// - Local image files
/// - Asset images
class AdaptiveImage extends StatelessWidget {
  const AdaptiveImage(
    this.source, {
    super.key,
    this.width = double.maxFinite,
    this.height = double.maxFinite,
    this.fit = BoxFit.contain,
    this.borderRadius = 8.0,
    this.placeholder,
    this.errorWidget,
    this.color,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.borderColor,
    this.borderWidth = 0.0,
    this.boxShadow,
    this.overlayColor,
    this.gradient,
    this.animationDuration = Duration.zero,
    this.animationCurve = Curves.linear,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  /// Source of the image (URL, file path, or asset name).
  final String source;

  /// Width of the image.
  final double width;

  /// Height of the image.
  final double height;

  /// How the image should be fitted inside the container.
  final BoxFit fit;

  /// Corner radius for rounding the image.
  final double borderRadius;

  /// Widget displayed while the image is loading.
  final Widget? placeholder;

  /// Widget displayed when the image fails to load.
  final Widget? errorWidget;

  /// Color filter applied to the image.
  final Color? color;

  /// Alignment of the image within its bounds.
  final Alignment alignment;

  /// Defines how the image should repeat if it does not fill its box.
  final ImageRepeat repeat;

  /// Color of the border around the image.
  final Color? borderColor;

  /// Width of the border around the image.
  final double borderWidth;

  /// Shadow applied to the image container.
  final List<BoxShadow>? boxShadow;

  /// Overlay color applied on top of the image.
  final Color? overlayColor;

  /// Gradient applied on top of the image.
  final Gradient? gradient;

  /// Duration of the animation for state changes.
  final Duration animationDuration;

  /// Curve for the animation.
  final Curve animationCurve;

  /// Callback for tap gestures.
  final VoidCallback? onTap;

  /// Callback for double-tap gestures.
  final VoidCallback? onDoubleTap;

  /// Callback for long-press gestures.
  final VoidCallback? onLongPress;

  /// Checks if the source is a network image.
  bool get isNetworkImage => Uri.tryParse(source)?.hasAbsolutePath ?? false;

  /// Checks if the source is an SVG image.
  bool get isSvg => source.toLowerCase().endsWith('.svg');

  /// Checks if the source is a local file.
  bool get isLocalFile => File(source).existsSync();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: animationCurve,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!, width: borderWidth) : null,
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: GestureDetector(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          child: Stack(
            children: [
              _buildImage(context),
              if (overlayColor != null) Container(color: overlayColor),
              if (gradient != null) Container(decoration: BoxDecoration(gradient: gradient)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (isSvg) {
      return isNetworkImage
          ? SvgPicture.network(
              source,
              width: width,
              height: height,
              fit: fit,
              colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
              alignment: alignment,
              placeholderBuilder: (context) => placeholder ?? _defaultPlaceholder(context),
            )
          : SvgPicture.asset(
              source,
              width: width,
              height: height,
              fit: fit,
              colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
              alignment: alignment,
            );
    }

    if (isNetworkImage) {
      return CachedNetworkImage(
        imageUrl: source,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        repeat: repeat,
        placeholder: (context, url) => placeholder ?? _defaultPlaceholder(context),
        errorWidget: (context, url, error) => errorWidget ?? _defaultErrorWidget(context),
      );
    }

    if (isLocalFile) {
      return Image.file(
        File(source),
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        repeat: repeat,
      );
    }

    return Image.asset(
      source,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      repeat: repeat,
      errorBuilder: (context, error, stackTrace) => errorWidget ?? _defaultErrorWidget(context),
    );
  }

  Widget _defaultPlaceholder(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }

  Widget _defaultErrorWidget(BuildContext context) {
    return const Center(child: Icon(Icons.error));
  }
}
