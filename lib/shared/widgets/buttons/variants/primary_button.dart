import 'package:flutter/material.dart';
import '../app_button.dart';
import '../app_button_config.dart';
import '../app_button_style.dart';

/// A primary button with brand colors, typically used for main actions.
/// 
/// Example:
/// ```dart
/// PrimaryButton(
///   text: 'Submit',
///   onPressed: () => _handleSubmit(),
/// )
/// ```
class PrimaryButton extends StatelessWidget {
  /// The text to display on the button
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool enabled;

  /// Fixed width of the button
  final double? width;

  /// Height of the button
  final double? height;

  /// Icon to display before the text
  final Widget? prefixIcon;

  /// Icon to display after the text
  final Widget? suffixIcon;

  /// Custom child widget (if provided, text is ignored)
  final Widget? child;

  const PrimaryButton({
    super.key,
    this.text = '',
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      child: child ?? _buildContent(),
      config: AppButtonConfig(
        onPressed: enabled ? onPressed : null,
        isLoading: isLoading,
        enabled: enabled,
        width: width,
        height: height,
      ),
      style: AppButtonStyle.primary(),
      expandWidth: true,
    );
  }

  Widget _buildContent() {
    if (prefixIcon != null || suffixIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            SizedBox(width: 8),
          ],
          Text(text),
          if (suffixIcon != null) ...[
            SizedBox(width: 8),
            suffixIcon!,
          ],
        ],
      );
    }
    return Text(text);
  }
}

