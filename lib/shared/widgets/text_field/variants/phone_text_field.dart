import 'package:flutter/material.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
import 'package:foody/shared/widgets/text/app_text.dart';
import '../app_text_field.dart';
import '../app_text_field_config.dart';
import '../app_text_field_style.dart';

/// A specialized text field for phone number input with country code selector.
///
/// This widget provides a built-in country code prefix and formats the input
/// for phone numbers. By default, it uses +963 (Syria) but can be customized.
///
/// Example:
/// ```dart
/// PhoneTextField(
///   controller: phoneController,
///   countryCode: '+963',
///   validator: Validators.phone,
/// )
/// ```
class PhoneTextField extends StatelessWidget {
  /// The controller for the text field
  final TextEditingController? controller;

  /// Hint text to display when the field is empty
  final String? hintText;

  /// Country code prefix (e.g., '+963', '+1', etc.)
  final String countryCode;

  /// Validator function for phone validation
  final String? Function(String?)? validator;

  /// Whether the phone field is required
  final bool isRequired;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Callback when the field is submitted
  final Function(String)? onSubmitted;

  /// Visual styling configuration
  final AppTextFieldStyle? style;

  /// Whether the field is enabled
  final bool enabled;

  /// Callback when country code is tapped (for country selector)
  final VoidCallback? onCountryCodeTap;

  const PhoneTextField({
    super.key,
    this.controller,
    this.hintText = 'Phone number',
    this.countryCode = '+963',
    this.validator,
    this.isRequired = true,
    this.onChanged,
    this.onSubmitted,
    this.style,
    this.enabled = true,
    this.onCountryCodeTap,
  });

  @override
  Widget build(BuildContext context) {
    final phoneStyle = (style ?? AppTextFieldStyle.standard()).copyWith(
      prefixIcon: _buildCountryCodePrefix(),
    );

    return AppTextField(
      controller: controller,
      config: AppTextFieldConfig.phone(
        hintText: hintText,
        isRequired: isRequired,
        validator: validator,
        onChanged: onChanged,
      ).copyWith(enabled: enabled, onSubmitted: onSubmitted),
      style: phoneStyle,
    );
  }

  Widget _buildCountryCodePrefix() {
    return GestureDetector(
      onTap: onCountryCodeTap,
      child: Row(
        spacing: 4.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            countryCode,
            typography: AppTypography.bodyMediumRegular,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: VerticalDivider(
              thickness: 1,
              color: AppColors.grey200,
              width: 1,
            ),
          ),
        ],
      ),
    );
  }
}
