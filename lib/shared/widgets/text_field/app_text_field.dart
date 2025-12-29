import 'package:flutter/material.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/core/config/config.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
import 'app_text_field_config.dart';
import 'app_text_field_style.dart';
import 'validation/text_field_validators.dart';

/// A simplified, flexible text field widget that separates configuration from styling.
///
/// This widget provides a clean API for creating text fields with consistent
/// behavior while allowing full customization through [AppTextFieldConfig] and
/// [AppTextFieldStyle].
///
/// Example:
/// ```dart
/// AppTextField(
///   controller: emailController,
///   config: AppTextFieldConfig.email(
///     validator: Validators.email,
///   ),
/// )
/// ```
class AppTextField extends StatefulWidget {
  /// The controller for the text field
  final TextEditingController? controller;

  /// Configuration for behavior (validation, keyboard type, etc.)
  final AppTextFieldConfig config;

  /// Visual styling configuration
  final AppTextFieldStyle? style;

  const AppTextField({
    super.key,
    this.controller,
    required this.config,
    this.style,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late AppTextFieldStyle _style;
  String? _errorMessage;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.config.obscureText;
    _style = widget.style ?? AppTextFieldStyle.standard();
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.style != widget.style) {
      _style = widget.style ?? AppTextFieldStyle.standard();
    }
    if (oldWidget.config.obscureText != widget.config.obscureText) {
      _obscureText = widget.config.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: _style.backgroundColor,
            borderRadius: BorderRadius.circular(_style.borderRadius),
          ),
          height: widget.config.maxLines == 1 ? _style.height ?? 58.h : null,
          child: Directionality(
            textDirection: _getTextDirection(),
            child: TextFormField(
              key: widget.config.formKey,
              controller: widget.controller,
              focusNode: widget.config.focusNode,
              onTap: widget.config.onTap,
              enabled: widget.config.enabled,
              autofocus: widget.config.autofocus,
              keyboardType: widget.config.keyboardType,
              textInputAction: widget.config.textInputAction,
              obscureText: _obscureText,
              enableSuggestions: widget.config.enableSuggestions,
              autocorrect: widget.config.autocorrect,
              maxLines: widget.config.maxLines,
              minLines: widget.config.minLines,
              maxLength: widget.config.maxLength,
              cursorColor: _style.cursorColor,
              style: _style.textStyle,
              decoration: _buildInputDecoration(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: _buildValidator(),
              onChanged: (value) {
                if (widget.config.onChanged != null) {
                  widget.config.onChanged!(value);
                }
                // Update error state on change if we're showing errors
                if (widget.config.showErrorText) {
                  setState(() {
                    _errorMessage = _buildValidator()?.call(value);
                  });
                }
              },
              onFieldSubmitted: widget.config.onSubmitted,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
          child: Column(
            children: [
              if (widget.config.showErrorText && _errorMessage != null) ...[
                AppText(
                  _errorMessage!,
                  color: AppColors.textError,
                  typography: AppTypography.bodyXSmallMedium,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  TextDirection _getTextDirection() {
    // Priority: explicit config > phone LTR > global isArabic
    if (widget.config.textDirection != null) {
      return widget.config.textDirection!;
    }
    if (widget.config.keyboardType == TextInputType.phone) {
      return TextDirection.ltr;
    }
    return isArabic ? TextDirection.rtl : TextDirection.ltr;
  }

  InputDecoration _buildInputDecoration() {
    final isEmpty = widget.controller?.text.trim().isEmpty ?? true;
    final isFocused = widget.config.focusNode?.hasFocus ?? false;
    final hasError = _errorMessage != null;
    final isDisabled = !widget.config.enabled;

    final borderColor =
        _style.borderColors?.getColor(
          isEmpty: isEmpty,
          isFocused: isFocused,
          hasError: hasError,
          isDisabled: isDisabled,
        ) ??
        Colors.grey;

    return InputDecoration(
      hintText: widget.config.hintText,
      hintStyle: _style.hintStyle,
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: _buildSuffixIcon(),
      prefixIconConstraints: _style.prefixIcon == null
          ? BoxConstraints(maxWidth: 50.w, maxHeight: 40.h)
          : null,
      contentPadding: _style.contentPadding,
      // Hide error text in decoration as we show it below
      errorStyle: const TextStyle(fontSize: 0, height: 0),
      enabledBorder: _style.showBorder
          ? _outlinedBorder(borderColor)
          : InputBorder.none,
      focusedBorder: _style.showBorder
          ? _outlinedBorder(borderColor)
          : InputBorder.none,
      errorBorder: _style.showBorder
          ? _outlinedBorder(borderColor)
          : InputBorder.none,
      focusedErrorBorder: _style.showBorder
          ? _outlinedBorder(borderColor)
          : InputBorder.none,
      disabledBorder: _style.showBorder
          ? _outlinedBorder(borderColor)
          : InputBorder.none,
      border: _style.showBorder
          ? _outlinedBorder(borderColor)
          : InputBorder.none,
    );
  }

  OutlineInputBorder _outlinedBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(_style.borderRadius),
    );
  }

  Widget? _buildPrefixIcon() {
    if (_style.prefixIcon == null) return null;

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 5.w),
      child: _style.prefixIcon,
    );
  }

  Widget? _buildSuffixIcon() {
    // If this is a password field (obscurable), show toggle icon
    if (widget.config.obscureText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            size: 20.w,
            color: Colors.grey,
          ),
        ),
      );
    }

    return _style.suffixIcon;
  }

  String? Function(String?)? _buildValidator() {
    final validators = <String? Function(String?)>[];

    // Add required validator if needed
    if (widget.config.isRequired) {
      validators.add(Validators.required);
    }

    // Add custom validator if provided
    if (widget.config.validator != null) {
      validators.add(widget.config.validator!);
    }

    // If no validators, return null
    if (validators.isEmpty) return null;

    // Compose all validators
    return Validators.compose(validators);
  }
}
