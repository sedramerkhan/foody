import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';

/// Visual styling configuration for AppImage.
/// 
/// This class separates visual appearance from behavior, making it easier
/// to customize the look of images while keeping functionality consistent.
class AppImageStyle {
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppImageStyle({
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
  });

  /// Factory constructor for standard style
  factory AppImageStyle.standard() {
    return const AppImageStyle(
      borderRadius: BorderRadius.zero,
    );
  }

  /// Factory constructor for rounded style
  factory AppImageStyle.rounded({double radius = 12.0}) {
    return AppImageStyle(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Factory constructor for circular style
  factory AppImageStyle.circular() {
    return const AppImageStyle(
      borderRadius: BorderRadius.all(Radius.circular(9999)),
    );
  }

  /// Factory constructor for style with background
  factory AppImageStyle.withBackground({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return AppImageStyle(
      backgroundColor: backgroundColor ?? AppColors.bgSurfaceSecondary,
      borderRadius: borderRadius ?? BorderRadius.zero,
    );
  }

  AppImageStyle copyWith({
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return AppImageStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      placeholder: placeholder ?? this.placeholder,
      errorWidget: errorWidget ?? this.errorWidget,
    );
  }
}

