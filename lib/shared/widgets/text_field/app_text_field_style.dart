import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';

/// Visual styling configuration for AppTextField.
/// 
/// This class separates visual appearance from behavior, making it easier
/// to customize the look of text fields while keeping functionality consistent.
class AppTextFieldStyle {
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showBorder;
  final double? height;
  final BorderColors? borderColors;

  const AppTextFieldStyle({
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.showBorder = true,
    this.height,
    this.borderColors,
  });

  /// Factory constructor for default style
  factory AppTextFieldStyle.standard({
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? height,
  }) {
    return AppTextFieldStyle(
      backgroundColor: Colors.transparent,
      borderRadius: 12.0,
      contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyMediumMedium,
        color: AppColors.textPrimaryAlt,
      ).materialTextStyle,
      hintStyle: null, // Use theme default
      cursorColor: AppColors.brand600,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      showBorder: true,
      height: height,
      borderColors: BorderColors.standard(),
    );
  }

  /// Factory constructor for filled style (with background color)
  factory AppTextFieldStyle.filled({
    Color? backgroundColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return AppTextFieldStyle(
      backgroundColor: backgroundColor ?? AppColors.grey50,
      borderRadius: 12.0,
      contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyMediumMedium,
        color: AppColors.textPrimaryAlt,
      ).materialTextStyle,
      cursorColor: AppColors.brand600,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      showBorder: false,
      borderColors: BorderColors.standard(),
    );
  }

  /// Factory constructor for borderless style
  factory AppTextFieldStyle.borderless({
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return AppTextFieldStyle(
      backgroundColor: Colors.transparent,
      borderRadius: 12.0,
      contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
      textStyle: ThemeTextStyle.fromTypography(
        typography: AppTypography.bodyMediumMedium,
        color: AppColors.textPrimaryAlt,
      ).materialTextStyle,
      cursorColor: AppColors.brand600,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      showBorder: false,
      borderColors: BorderColors.standard(),
    );
  }

  AppTextFieldStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsets? contentPadding,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    Color? cursorColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? showBorder,
    double? height,
    BorderColors? borderColors,
  }) {
    return AppTextFieldStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      cursorColor: cursorColor ?? this.cursorColor,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      showBorder: showBorder ?? this.showBorder,
      height: height ?? this.height,
      borderColors: borderColors ?? this.borderColors,
    );
  }
}

/// Border colors for different text field states
class BorderColors {
  final Color empty;
  final Color filled;
  final Color focused;
  final Color error;
  final Color disabled;
  final Color success;

  const BorderColors({
    required this.empty,
    required this.filled,
    required this.focused,
    required this.error,
    required this.disabled,
    required this.success,
  });

  /// Factory constructor for standard border colors from theme
  factory BorderColors.standard() {
    return BorderColors(
      empty: AppColors.borderPrimary,
      filled: AppColors.borderSecondary,
      focused: AppColors.borderBrand,
      error: AppColors.borderError,
      disabled: AppColors.grey200,
      success: AppColors.bgFillSuccess,
    );
  }

  /// Get border color based on field state
  Color getColor({
    required bool isEmpty,
    required bool isFocused,
    required bool hasError,
    required bool isDisabled,
    bool isSuccess = false,
  }) {
    if (isDisabled) return disabled;
    if (hasError) return error;
    if (isSuccess) return success;
    if (isFocused) return focused;
    if (isEmpty) return empty;
    return filled;
  }

  BorderColors copyWith({
    Color? empty,
    Color? filled,
    Color? focused,
    Color? error,
    Color? disabled,
    Color? success,
  }) {
    return BorderColors(
      empty: empty ?? this.empty,
      filled: filled ?? this.filled,
      focused: focused ?? this.focused,
      error: error ?? this.error,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
    );
  }
}

