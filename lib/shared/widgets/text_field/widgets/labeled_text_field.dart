import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
import 'package:foody/shared/widgets/text/app_text.dart';
import '../app_text_field.dart';
import '../app_text_field_config.dart';
import '../app_text_field_style.dart';

/// A text field with a label above it.
/// 
/// This widget wraps any text field with a label, and optionally shows
/// a required indicator, helper text, or character counter.
/// 
/// Example:
/// ```dart
/// LabeledTextField(
///   label: 'Email Address',
///   isRequired: true,
///   controller: emailController,
///   config: AppTextFieldConfig.email(),
/// )
/// ```
class LabeledTextField extends StatelessWidget {
  /// The label text to display above the field
  final String label;

  /// The controller for the text field
  final TextEditingController? controller;

  /// Configuration for the text field
  final AppTextFieldConfig config;

  /// Visual styling configuration
  final AppTextFieldStyle? style;

  /// Whether to show a required indicator (*)
  final bool showRequiredIndicator;

  /// Helper text to show below the label
  final String? helperText;

  /// Whether to show character counter
  final bool showCharacterCounter;

  /// Spacing between label and text field
  final double spacing;

  /// Label text style (if null, uses default)
  final TextStyle? labelStyle;

  const LabeledTextField({
    super.key,
    required this.label,
    this.controller,
    required this.config,
    this.style,
    this.showRequiredIndicator = true,
    this.helperText,
    this.showCharacterCounter = false,
    this.spacing = 4.0,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing.h,
      children: [
        _buildLabel(),
        if (helperText != null) ...[
          Text(
            helperText!,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
        ],
        AppTextField(
          controller: controller,
          config: config,
          style: style,
        ),
        if (showCharacterCounter && config.maxLength != null)
          _buildCharacterCounter(),
      ],
    );
  }

  Widget _buildLabel() {
    return Row(
      children: [
        AppText(
          label,
          typography: AppTypography.bodySmallMedium,
          color: AppColors.textPrimary,
        ),
        if (showRequiredIndicator && config.isRequired) ...[
          SizedBox(width: 2.w),
          AppText(
            '*',
            typography: AppTypography.bodySmallMedium,
            color: AppColors.borderError,
          ),
        ],
      ],
    );
  }

  Widget _buildCharacterCounter() {
    final currentLength = controller?.text.length ?? 0;
    final maxLength = config.maxLength ?? 0;

    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text(
          '$currentLength / $maxLength',
          style: TextStyle(
            fontSize: 12,
            color: currentLength > maxLength
                ? AppColors.borderError
                : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

