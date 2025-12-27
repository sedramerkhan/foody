import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';

/// Visual styling configuration for AppText.
/// 
/// This class separates visual appearance from behavior, making it easier
/// to customize the look of text while keeping functionality consistent.
/// 
/// Note: This is different from the theme's AppTextStyle class.
class AppTextStyle {
  final AppTypography? typography;
  final Color? color;
  final TextDecoration textDecoration;

  const AppTextStyle({
    this.typography,
    this.color,
    this.textDecoration = TextDecoration.none,
  });

  /// Factory constructor for standard text style
  factory AppTextStyle.standard({
    AppTypography? typography,
    Color? color,
  }) {
    return AppTextStyle(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: color ?? AppColors.textSecondaryAlt,
    );
  }

  /// Factory constructor for primary text style
  factory AppTextStyle.primary({
    AppTypography? typography,
  }) {
    return AppTextStyle(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: AppColors.textPrimary,
    );
  }

  /// Factory constructor for secondary text style
  factory AppTextStyle.secondary({
    AppTypography? typography,
  }) {
    return AppTextStyle(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: AppColors.textSecondaryAlt,
    );
  }

  /// Factory constructor for brand text style
  factory AppTextStyle.brand({
    AppTypography? typography,
  }) {
    return AppTextStyle(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: AppColors.textBrand,
    );
  }

  /// Factory constructor for error text style
  factory AppTextStyle.error({
    AppTypography? typography,
  }) {
    return AppTextStyle(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: AppColors.textError,
    );
  }

  /// Factory constructor for underlined text style
  factory AppTextStyle.underlined({
    AppTypography? typography,
    Color? color,
  }) {
    return AppTextStyle(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: color ?? AppColors.textSecondaryAlt,
      textDecoration: TextDecoration.underline,
    );
  }

  /// Convert to Flutter's TextStyle
  TextStyle toTextStyle() {
    return ThemeTextStyle.fromTypography(
      typography: typography ?? AppTypography.bodyLargeMedium,
      color: color ?? AppColors.textSecondaryAlt,
    ).copyWith(textDecoration: textDecoration).materialTextStyle;
  }

  AppTextStyle copyWith({
    AppTypography? typography,
    Color? color,
    TextDecoration? textDecoration,
  }) {
    return AppTextStyle(
      typography: typography ?? this.typography,
      color: color ?? this.color,
      textDecoration: textDecoration ?? this.textDecoration,
    );
  }
}

