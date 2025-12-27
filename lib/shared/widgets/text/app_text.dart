import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';

/// A simple text widget with color and typography.
/// 
/// Example:
/// ```dart
/// AppText(
///   'Hello World',
///   typography: AppTypography.bodyLargeMedium,
///   color: AppColors.textPrimary,
///   textDecoration: TextDecoration.underline,
/// )
/// ```
class AppText extends StatelessWidget {
  /// The text content to display
  final String data;

  /// Typography style
  final AppTypography? typography;

  /// Text color
  final Color? color;

  /// Maximum number of lines
  final int? maxLines;

  /// Text alignment
  final TextAlign textAlign;

  /// How to handle text overflow
  final TextOverflow overflow;

  /// Text decoration (underline, lineThrough, etc.)
  final TextDecoration textDecoration;

  const AppText(
    this.data, {
    super.key,
    this.typography,
    this.color,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = ThemeTextStyle.fromTypography(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: color ?? AppColors.textSecondaryAlt,
    ).materialTextStyle.copyWith(
      decoration: textDecoration,
    );

    return Text(
      data,
      style: textStyle,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

