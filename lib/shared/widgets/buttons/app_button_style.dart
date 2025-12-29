import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';

/// Visual styling configuration for AppButton.
/// 
/// This class separates visual appearance from behavior, making it easier
/// to customize the look of buttons while keeping functionality consistent.
class AppButtonStyle {
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color hoverColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final EdgeInsets? padding;
  final double borderRadius;
  final double? elevation;
  final Gradient? gradient;

  const AppButtonStyle({
    required this.textStyle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.hoverColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.padding,
    this.borderRadius = 12.0,
    this.elevation = 0,
    this.gradient,
  });

  /// Factory constructor for primary button style
  factory AppButtonStyle.primary() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: Colors.white,
      ).materialTextStyle,
      backgroundColor: AppColors.buttonBrand,
      foregroundColor: Colors.white,
      borderColor: Colors.transparent,
      hoverColor: Colors.white.withValues(alpha: 0.3),
      disabledBackgroundColor: AppColors.buttonDisabled,
      disabledForegroundColor: AppColors.buttonLabelDisabled,
      borderRadius: 12.0,
    );
  }

  /// Factory constructor for secondary button style
  factory AppButtonStyle.secondary() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: AppColors.textPrimary,
      ).materialTextStyle,
      backgroundColor: AppColors.bgSurfaceSecondary,
      foregroundColor: AppColors.textPrimary,
      borderColor: Colors.transparent,
      hoverColor: Colors.white.withValues(alpha: 0.3),
      borderRadius: 12.0,
    );
  }

  /// Factory constructor for outlined button style
  factory AppButtonStyle.outlined() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: AppColors.textBrand,
      ).materialTextStyle,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.textBrand,
      borderColor: AppColors.buttonBrand,
      hoverColor: Colors.grey.shade200,
      borderRadius: 12.0,
    );
  }

  /// Factory constructor for text button style
  factory AppButtonStyle.text() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: AppColors.buttonLabelBrand,
      ).materialTextStyle,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.buttonLabelBrand,
      borderColor: Colors.transparent,
      hoverColor: Colors.grey.shade200,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      borderRadius: 25.0,
    );
  }

  /// Factory constructor for disabled text button style
  factory AppButtonStyle.disabledText() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: AppColors.buttonLabelDisabled,
      ).materialTextStyle,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.buttonLabelDisabled,
      borderColor: Colors.transparent,
      hoverColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      borderRadius: 25.0,
    );
  }

  /// Factory constructor for underlined text button style
  factory AppButtonStyle.textUnderlined() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodySmallRegular,
        color: AppColors.buttonLabelBrand,
      ).copyWith(textDecoration: TextDecoration.underline).materialTextStyle,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.buttonLabelBrand,
      borderColor: Colors.transparent,
      hoverColor: Colors.grey.shade200,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      borderRadius: 25.0,
    );
  }

  /// Factory constructor for disabled button style
  factory AppButtonStyle.disabled() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: AppColors.buttonLabelDisabled,
      ).materialTextStyle,
      backgroundColor: AppColors.buttonDisabled,
      foregroundColor: AppColors.buttonLabelDisabled,
      borderColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: 12.0,
    );
  }

  /// Factory constructor for gradient primary button style
  factory AppButtonStyle.gradientPrimary() {
    return AppButtonStyle(
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyLargeMedium,
        color: Colors.white,
      ).materialTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: AppColors.buttonBrand,
      foregroundColor: Colors.white,
      borderColor: Colors.transparent,
      hoverColor: Colors.white.withValues(alpha: 0.2),
      disabledBackgroundColor: AppColors.buttonDisabled,
      disabledForegroundColor: AppColors.buttonLabelDisabled,
      borderRadius: 25.0,
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.brand500,
          AppColors.brand700,
        ],
      ),
    );
  }

  /// Convert to Flutter's ButtonStyle
  ButtonStyle toButtonStyle({bool isDisabled = false}) {
    final bgColor = isDisabled && disabledBackgroundColor != null
        ? disabledBackgroundColor!
        : backgroundColor;
    final fgColor = isDisabled && disabledForegroundColor != null
        ? disabledForegroundColor!
        : foregroundColor;

    return ButtonStyle(
      elevation: WidgetStateProperty.all(elevation),
      backgroundColor: WidgetStateProperty.all(bgColor),
      foregroundColor: WidgetStateProperty.all(fgColor),
      overlayColor: WidgetStateProperty.all(hoverColor),
      side: WidgetStateProperty.all(BorderSide(color: borderColor)),
      textStyle: WidgetStateProperty.all(textStyle),
      padding: WidgetStateProperty.all(padding),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  AppButtonStyle copyWith({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? hoverColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    EdgeInsets? padding,
    double? borderRadius,
    double? elevation,
    Gradient? gradient,
  }) {
    return AppButtonStyle(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
      hoverColor: hoverColor ?? this.hoverColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor ?? this.disabledForegroundColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      gradient: gradient ?? this.gradient,
    );
  }
}

