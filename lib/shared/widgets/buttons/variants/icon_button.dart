import 'package:flutter/material.dart';
import '../app_button.dart';
import '../app_button_config.dart';
import '../app_button_style.dart';

/// An icon-only button, typically used for compact actions.
/// 
/// Example:
/// ```dart
/// AppIconButton(
///   icon: Icon(Icons.add),
///   onPressed: () => _handleAdd(),
/// )
/// ```
class AppIconButton extends StatelessWidget {
  /// The icon to display
  final Widget icon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool enabled;

  /// Fixed width of the button
  final double? width;

  /// Fixed height of the button
  final double? height;

  /// Border radius (defaults to circular for icon buttons)
  final double borderRadius;

  /// Visual styling configuration
  final AppButtonStyle? style;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = 48,
    this.height = 48,
    this.borderRadius = 24.0,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = (style ?? AppButtonStyle.primary()).copyWith(
      borderRadius: borderRadius,
      padding: EdgeInsets.zero,
    );

    return AppButton(
      child: icon,
      config: AppButtonConfig(
        onPressed: enabled ? onPressed : null,
        isLoading: isLoading,
        enabled: enabled,
        width: width,
        height: height,
      ),
      style: buttonStyle,
    );
  }
}

