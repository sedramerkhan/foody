import 'package:flutter/material.dart';
import '../app_button.dart';
import '../app_button_config.dart';
import '../app_button_style.dart';

/// A text button with no background, typically used for tertiary actions.
/// 
/// Example:
/// ```dart
/// AppTextButton(
///   text: 'Skip',
///   onPressed: () => _handleSkip(),
/// )
/// ```
class AppTextButton extends StatelessWidget {
  /// The text to display on the button
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool enabled;

  /// Whether to underline the text
  final bool underlined;

  /// Fixed width of the button
  final double? width;

  /// Height of the button
  final double? height;

  /// Custom child widget (if provided, text is ignored)
  final Widget? child;

  const AppTextButton({
    super.key,
    this.text = '',
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.underlined = false,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final style = underlined
        ? AppButtonStyle.textUnderlined()
        : (enabled ? AppButtonStyle.text() : AppButtonStyle.disabledText());

    return AppButton(
      child: child ?? Text(text),
      config: AppButtonConfig(
        onPressed: enabled ? onPressed : null,
        isLoading: isLoading,
        enabled: enabled,
        width: width,
        height: height,
      ),
      style: style,
    );
  }
}

