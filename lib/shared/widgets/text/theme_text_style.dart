import 'package:flutter/material.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/core/theme/theme.dart';

/// Theme-level text style utility that builds Material TextStyle from typography.
/// 
/// This is a utility class used by widgets to create TextStyle from theme typography.
/// It combines typography (font size, weight) with color and other text properties.
class ThemeTextStyle {
  ///
  final AppTypography typography;

  ///
  final String fontFamily;

  ///
  final Color color;

  ///
  final TextAlign textAlign;

  ///
  final int? maxLines;

  ///
  final TextOverflow? overflow;

  ///
  final TextDecoration textDecoration;

  const ThemeTextStyle({
    required this.typography,
    this.fontFamily = defaultFontFamily,
    this.color = const Color(0xFF606E87),
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
  });

  /// Factory constructor for creating TextStyle from typography and color
  factory ThemeTextStyle.fromTypography({
    required AppTypography typography,
    required Color color,
    String? fontFamily,
  }) {
    return ThemeTextStyle(
      typography: typography,
      color: color,
      fontFamily: fontFamily ?? defaultFontFamily,
    );
  }

  /// This is used to add/edit existing object.
  ThemeTextStyle copyWith({
    AppTypography? typography,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? textDecoration,
    String? fontFamily,
  }) {
    return ThemeTextStyle(
      typography: typography ?? this.typography,
      fontFamily: fontFamily ?? this.fontFamily,
      color: color ?? this.color,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      textDecoration: textDecoration ?? this.textDecoration,
    );
  }

  /// Convert to Flutter's TextStyle for use in Material widgets
  TextStyle get materialTextStyle {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: typography.fontSize,
      fontWeight: typography.fontWeight,
      fontFamily: fontFamily,
      decoration: textDecoration,
      decorationColor: color,
    );
  }
}
