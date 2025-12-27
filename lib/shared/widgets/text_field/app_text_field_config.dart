import 'package:flutter/material.dart';

/// Configuration class for AppTextField that separates behavior from styling.
/// 
/// This class handles the functional configuration of a text field including
/// validation, keyboard behavior, and callbacks.
class AppTextFieldConfig {
  final String? hintText;
  final bool isRequired;
  final bool enabled;
  final bool autofocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState>? formKey;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextDirection? textDirection;
  final bool showErrorText;

  const AppTextFieldConfig({
    this.hintText,
    this.isRequired = false,
    this.enabled = true,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.formKey,
    this.focusNode,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = false,
    this.textDirection,
    this.showErrorText = true,
  });

  /// Factory constructor for standard single-line text input
  factory AppTextFieldConfig.standard({
    String? hintText,
    bool isRequired = false,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputAction textInputAction = TextInputAction.next,
    FocusNode? focusNode,
    bool showErrorText = true,
  }) {
    return AppTextFieldConfig(
      hintText: hintText,
      isRequired: isRequired,
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
      focusNode: focusNode,
      showErrorText: showErrorText,
    );
  }

  /// Factory constructor for email input
  factory AppTextFieldConfig.email({
    String? hintText = 'Email',
    bool isRequired = true,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    FocusNode? focusNode,
    bool showErrorText = true,
  }) {
    return AppTextFieldConfig(
      hintText: hintText,
      isRequired: isRequired,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      enableSuggestions: false,
      focusNode: focusNode,
      showErrorText: showErrorText,
    );
  }

  /// Factory constructor for phone input
  factory AppTextFieldConfig.phone({
    String? hintText = 'Phone number',
    bool isRequired = true,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    FocusNode? focusNode,
    bool showErrorText = true,
  }) {
    return AppTextFieldConfig(
      hintText: hintText,
      isRequired: isRequired,
      keyboardType: TextInputType.phone,
      validator: validator,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      textDirection: TextDirection.ltr,
      focusNode: focusNode,
      showErrorText: showErrorText,
    );
  }

  /// Factory constructor for multiline text input
  factory AppTextFieldConfig.multiline({
    String? hintText,
    bool isRequired = false,
    int maxLines = 5,
    int? minLines = 3,
    int? maxLength,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    FocusNode? focusNode,
    bool showErrorText = true,
  }) {
    return AppTextFieldConfig(
      hintText: hintText,
      isRequired: isRequired,
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      textInputAction: TextInputAction.newline,
      focusNode: focusNode,
      showErrorText: showErrorText,
    );
  }

  /// Factory constructor for password input
  factory AppTextFieldConfig.password({
    String? hintText = 'Password',
    bool isRequired = true,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    FocusNode? focusNode,
    bool showErrorText = true,
  }) {
    return AppTextFieldConfig(
      hintText: hintText,
      isRequired: isRequired,
      obscureText: true,
      validator: validator,
      onChanged: onChanged,
      textInputAction: TextInputAction.done,
      enableSuggestions: false,
      autocorrect: false,
      focusNode: focusNode,
      showErrorText: showErrorText,
    );
  }

  /// Factory constructor for number input
  factory AppTextFieldConfig.number({
    String? hintText,
    bool isRequired = false,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    FocusNode? focusNode,
    bool showErrorText = true,
  }) {
    return AppTextFieldConfig(
      hintText: hintText,
      isRequired: isRequired,
      keyboardType: TextInputType.number,
      validator: validator,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      showErrorText: showErrorText,
    );
  }

  AppTextFieldConfig copyWith({
    String? hintText,
    bool? isRequired,
    bool? enabled,
    bool? autofocus,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? maxLines,
    int? minLines,
    int? maxLength,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    VoidCallback? onTap,
    String? Function(String?)? validator,
    GlobalKey<FormFieldState>? formKey,
    FocusNode? focusNode,
    bool? obscureText,
    bool? enableSuggestions,
    bool? autocorrect,
    TextDirection? textDirection,
    bool? showErrorText,
  }) {
    return AppTextFieldConfig(
      hintText: hintText ?? this.hintText,
      isRequired: isRequired ?? this.isRequired,
      enabled: enabled ?? this.enabled,
      autofocus: autofocus ?? this.autofocus,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      maxLines: maxLines ?? this.maxLines,
      minLines: minLines ?? this.minLines,
      maxLength: maxLength ?? this.maxLength,
      onChanged: onChanged ?? this.onChanged,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onTap: onTap ?? this.onTap,
      validator: validator ?? this.validator,
      formKey: formKey ?? this.formKey,
      focusNode: focusNode ?? this.focusNode,
      obscureText: obscureText ?? this.obscureText,
      enableSuggestions: enableSuggestions ?? this.enableSuggestions,
      autocorrect: autocorrect ?? this.autocorrect,
      textDirection: textDirection ?? this.textDirection,
      showErrorText: showErrorText ?? this.showErrorText,
    );
  }
}

