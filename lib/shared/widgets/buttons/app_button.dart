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
///   child: Text('Click me'),
///   config: AppButtonConfig.enabled(onPressed: () => print('Clicked')),
///   style: AppButtonStyle.primary(),
/// )
/// ```
class AppButton extends StatelessWidget {
  /// The content/widget to display in the button
  final Widget child;

  /// Configuration for behavior (callbacks, loading state, etc.)
  final AppButtonConfig config;

  /// Visual styling configuration
  final AppButtonStyle? style;

  /// Whether button should expand to full width (for primary/secondary styles)
  final bool expandWidth;

  const AppButton({
    super.key,
    required this.child,
    required this.config,
    this.style,
    this.expandWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = style ?? AppButtonStyle.primary();
    final isDisabled = !config.canPress;

    return SizedBox(
      width: config.width ?? (expandWidth ? double.infinity : null),
      height: config.height ?? 48.h,
      child: ElevatedButton(
        onPressed: config.canPress ? config.onPressed : null,
        style: buttonStyle.toButtonStyle(isDisabled: isDisabled),
        child: config.isLoading
            ? _buildLoadingIndicator(buttonStyle, isDisabled)
            : child,
      ),
    );
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

