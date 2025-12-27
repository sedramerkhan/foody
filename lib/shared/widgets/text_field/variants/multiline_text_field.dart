import 'package:flutter/material.dart';
import '../app_text_field.dart';
import '../app_text_field_config.dart';
import '../app_text_field_style.dart';

/// A specialized text field for multiline text input (text areas).
/// 
/// This widget is pre-configured for longer text input with multiple lines,
/// commonly used for comments, descriptions, or notes.
/// 
/// Example:
/// ```dart
/// MultilineTextField(
///   controller: notesController,
///   hintText: 'Enter your notes here',
///   maxLines: 5,
///   minLines: 3,
/// )
/// ```
class MultilineTextField extends StatelessWidget {
  /// The controller for the text field
  final TextEditingController? controller;

  /// Hint text to display when the field is empty
  final String? hintText;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum character length
  final int? maxLength;

  /// Validator function
  final String? Function(String?)? validator;

  /// Whether the field is required
  final bool isRequired;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Callback when the field is submitted
  final Function(String)? onSubmitted;

  /// Visual styling configuration
  final AppTextFieldStyle? style;

  /// Whether the field is enabled
  final bool enabled;

  const MultilineTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines = 5,
    this.minLines = 3,
    this.maxLength,
    this.validator,
    this.isRequired = false,
    this.onChanged,
    this.onSubmitted,
    this.style,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      config: AppTextFieldConfig.multiline(
        hintText: hintText,
        isRequired: isRequired,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
      ).copyWith(
        enabled: enabled,
        onSubmitted: onSubmitted,
      ),
      style: style,
    );
  }
}

