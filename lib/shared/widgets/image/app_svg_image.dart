import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';

export 'package:flutter_svg/flutter_svg.dart';

/// A simplified SVG image widget with consistent sizing and color support.
/// 
/// This widget provides a clean API for displaying SVG images with automatic
/// sizing and color filtering.
/// 
/// Example:
/// ```dart
/// AppSvgImage(
///   assetPath: 'assets/icons/icon.svg',
///   size: 24,
///   color: Colors.blue,
/// )
/// ```
class AppSvgImage extends StatelessWidget {
  /// Path to the SVG asset
  final String assetPath;

  /// Size of the SVG (both width and height)
  final double? size;

  /// Width of the SVG
  final double? width;

  /// Height of the SVG
  final double? height;

  /// Color to apply to the SVG
  final Color? color;

  const AppSvgImage({
    super.key,
    required this.assetPath,
    this.size,
    this.width,
    this.height,
    this.color,
  });

  /// Factory constructor for sized SVG
  factory AppSvgImage.sized({
    required String assetPath,
    required double size,
    Color? color,
  }) {
    return AppSvgImage(
      assetPath: assetPath,
      size: size,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? size?.w,
      height: height ?? size?.h,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}

