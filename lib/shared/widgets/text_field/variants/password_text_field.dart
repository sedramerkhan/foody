import 'package:flutter/material.dart';
import '../app_text_field.dart';
import '../app_text_field_config.dart';
import '../app_text_field_style.dart';
import '../validation/text_field_validators.dart';

/// A specialized text field for password input with built-in obscure text toggle.
/// 
/// This widget automatically handles password visibility toggling and provides
/// sensible defaults for password fields (no suggestions, no autocorrect).
/// 
/// Example:
/// ```dart
/// PasswordTextField(
///   controller: passwordController,
///   hintText: 'Enter your password',
///   validator: Validators.password,
/// )
/// ```
class PasswordTextField extends StatelessWidget {
  /// The controller for the text field
  final TextEditingController? controller;

  /// Hint text to display when the field is empty
  final String? hintText;

  /// Validator function for password validation
  final String? Function(String?)? validator;

  /// Whether the password field is required
  final bool isRequired;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Callback when the field is submitted
  final Function(String)? onSubmitted;

  /// Visual styling configuration
  final AppTextFieldStyle? style;

  /// Whether the field is enabled
  final bool enabled;

  /// Text input action
  final TextInputAction textInputAction;

  const PasswordTextField({
    super.key,
    this.controller,
    this.hintText = 'Password',
    this.validator,
    this.isRequired = true,
    this.onChanged,
    this.onSubmitted,
    this.style,
    this.enabled = true,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      config: AppTextFieldConfig.password(
        hintText: hintText,
        isRequired: isRequired,
        validator: validator,
        onChanged: onChanged,
      ).copyWith(
        enabled: enabled,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
      ),
      style: style,
    );
  }
}

