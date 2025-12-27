import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';

/// Visual styling configuration for ClickableContainer.
/// 
/// This class separates visual appearance from behavior, making it easier
/// to customize the look of containers while keeping functionality consistent.
class ClickableContainerStyle {
  final Color? color;
  final Color? rippleColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? boxShadow;
  final bool withShadows;

  const ClickableContainerStyle({
    this.color,
    this.rippleColor,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
    this.alignment,
    this.boxShadow,
    this.withShadows = false,
  });

  /// Factory constructor for standard style
  factory ClickableContainerStyle.standard({
    Color? color,
    Color? rippleColor,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
  }) {
    return ClickableContainerStyle(
      color: color,
      rippleColor: rippleColor,
      padding: padding,
      borderRadius: borderRadius,
      withShadows: false,
    );
  }

  /// Factory constructor for style with shadows
  factory ClickableContainerStyle.withShadows({
    Color? color,
    Color? rippleColor,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
  }) {
    return ClickableContainerStyle(
      color: color,
      rippleColor: rippleColor,
      padding: padding,
      borderRadius: borderRadius,
      withShadows: true,
      boxShadow: boxShadow ??
          [
            const BoxShadow(
              color: Color(0x12576F85),
              offset: Offset(0, -1),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
    );
  }

  /// Factory constructor for bordered style
  factory ClickableContainerStyle.bordered({
    Color? color,
    Color? borderColor,
    double borderWidth = 1.0,
    BorderRadius? borderRadius,
    Color? rippleColor,
  }) {
    return ClickableContainerStyle(
      color: color,
      rippleColor: rippleColor,
      borderRadius: borderRadius,
      border: Border.all(
        color: borderColor ?? AppColors.borderPrimary,
        width: borderWidth,
      ),
      withShadows: false,
    );
  }

  ClickableContainerStyle copyWith({
    Color? color,
    Color? rippleColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Border? border,
    BorderRadius? borderRadius,
    AlignmentGeometry? alignment,
    List<BoxShadow>? boxShadow,
    bool? withShadows,
  }) {
    return ClickableContainerStyle(
      color: color ?? this.color,
      rippleColor: rippleColor ?? this.rippleColor,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      alignment: alignment ?? this.alignment,
      boxShadow: boxShadow ?? this.boxShadow,
      withShadows: withShadows ?? this.withShadows,
    );
  }
}

