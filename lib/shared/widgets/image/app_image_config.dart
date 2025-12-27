import 'package:flutter/material.dart';

/// Configuration class for AppImage that separates behavior from styling.
/// 
/// This class handles the functional configuration of image widgets including
/// dimensions, fit, and error handling.
class AppImageConfig {
  /// Image URL
  final String imageUrl;

  /// Fixed width of the image
  final double? width;

  /// Fixed height of the image
  final double? height;

  /// How the image should be inscribed into the available space
  final BoxFit fit;

  /// Maximum number of retry attempts for failed image loads
  final int maxRetries;

  /// Custom error widget to display when image fails to load
  final Widget? errorWidget;

  /// Color overlay for the image
  final Color? color;

  const AppImageConfig({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.maxRetries = 3,
    this.errorWidget,
    this.color,
  });

  /// Factory constructor for standard image
  factory AppImageConfig.standard({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return AppImageConfig(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
    );
  }

  /// Factory constructor for full-width image
  factory AppImageConfig.fullWidth({
    required String imageUrl,
    required double height,
    BoxFit fit = BoxFit.cover,
  }) {
    return AppImageConfig(
      imageUrl: imageUrl,
      width: double.infinity,
      height: height,
      fit: fit,
    );
  }

  /// Factory constructor for square image
  factory AppImageConfig.square({
    required String imageUrl,
    required double size,
    BoxFit fit = BoxFit.cover,
  }) {
    return AppImageConfig(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: fit,
    );
  }

  AppImageConfig copyWith({
    String? imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
    int? maxRetries,
    Widget? errorWidget,
    Color? color,
  }) {
    return AppImageConfig(
      imageUrl: imageUrl ?? this.imageUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      maxRetries: maxRetries ?? this.maxRetries,
      errorWidget: errorWidget ?? this.errorWidget,
      color: color ?? this.color,
    );
  }
}

