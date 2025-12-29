import 'package:flutter/material.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
import 'app_button_config.dart';
import 'app_button_style.dart';

/// A simplified, flexible button widget that separates configuration from styling.
/// 
/// This widget provides a clean API for creating buttons with consistent
/// behavior while allowing full customization through [AppButtonConfig] and
/// [AppButtonStyle].
/// 
/// Example:
/// ```dart
/// AppButton(
///   text: 'Click me',
///   config: AppButtonConfig.enabled(onPressed: () => print('Clicked')),
///   style: AppButtonStyle.primary(),
/// )
/// ```
class AppButton extends StatelessWidget {
  /// The text to display on the button (if provided, child is ignored)
  final String? text;

  /// The content/widget to display in the button (used if text is not provided)
  final Widget? child;

  /// Configuration for behavior (callbacks, loading state, etc.)
  final AppButtonConfig config;

  /// Visual styling configuration
  final AppButtonStyle? style;

  /// Whether button should expand to full width (for primary/secondary styles)
  final bool expandWidth;

  const AppButton({
    super.key,
    this.text,
    this.child,
    required this.config,
    this.style,
    this.expandWidth = false,
  }) : assert(text != null || child != null, 'Either text or child must be provided');

  @override
  Widget build(BuildContext context) {
    final buttonStyle = style ?? AppButtonStyle.primary();
    final isDisabled = !config.canPress;
    final buttonChild = _buildButtonChild(buttonStyle, isDisabled);

    // If gradient is provided and button is enabled, use gradient decoration
    if (buttonStyle.gradient != null && !isDisabled) {
      return SizedBox(
        width: config.width ?? (expandWidth ? double.infinity : null),
        height: config.height ?? 48.h,
        child: Container(
          decoration: BoxDecoration(
            gradient: buttonStyle.gradient,
            borderRadius: BorderRadius.circular(buttonStyle.borderRadius),
          ),
          child: ElevatedButton(
            onPressed: config.canPress ? config.onPressed : null,
            style: buttonStyle.toButtonStyle(isDisabled: isDisabled).copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: buttonChild,
          ),
        ),
      );
    }

    // Default behavior - solid color (no gradient)
    return SizedBox(
      width: config.width ?? (expandWidth ? double.infinity : null),
      height: config.height ?? 48.h,
      child: ElevatedButton(
        onPressed: config.canPress ? config.onPressed : null,
        style: buttonStyle.toButtonStyle(isDisabled: isDisabled),
        child: buttonChild,
      ),
    );
  }

  Widget _buildButtonChild(AppButtonStyle buttonStyle, bool isDisabled) {
    if (config.isLoading) {
      return _buildLoadingIndicator(buttonStyle, isDisabled);
    }

    // If text is provided, use it with the style's textStyle
    if (text != null) {
      return Text(
        text!,
        style: buttonStyle.textStyle,
      );
    }

    // Otherwise use the provided child
    return child!;
  }

  Widget _buildLoadingIndicator(AppButtonStyle buttonStyle, bool isDisabled) {
    final color = isDisabled && buttonStyle.disabledForegroundColor != null
        ? buttonStyle.disabledForegroundColor!
        : buttonStyle.foregroundColor;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        width: 20.w,
        height: 20.h,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}

