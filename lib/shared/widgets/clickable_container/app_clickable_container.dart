import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/shared/widgets/ripple_ink_well.dart';
import 'clickable_container_config.dart';
import 'clickable_container_style.dart';

/// A simplified, flexible clickable container widget that separates configuration from styling.
/// 
/// This widget provides a clean API for creating clickable containers with consistent
/// behavior while allowing full customization through [ClickableContainerConfig] and
/// [ClickableContainerStyle].
/// 
/// Example:
/// ```dart
/// AppClickableContainer(
///   child: Text('Click me'),
///   config: ClickableContainerConfig.enabled(
///     onTap: () => print('Clicked'),
///   ),
///   style: ClickableContainerStyle.standard(),
/// )
/// ```
class AppClickableContainer extends StatelessWidget {
  /// The content/widget to display in the container
  final Widget child;

  /// Configuration for behavior (callbacks, dimensions, etc.)
  final ClickableContainerConfig config;

  /// Visual styling configuration
  final ClickableContainerStyle? style;

  const AppClickableContainer({
    super.key,
    required this.child,
    required this.config,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final containerStyle = style ?? ClickableContainerStyle.standard();
    final rippleColor = containerStyle.rippleColor ??
        (config.isClickable
            ? AppColors.grey100.withValues(alpha: 0.8)
            : null);

    return Container(
      width: config.width,
      height: config.height,
      constraints: BoxConstraints(
        minWidth: config.minWidth ?? 0,
        minHeight: config.minHeight ?? 0,
        maxWidth: config.maxWidth ?? double.infinity,
        maxHeight: config.maxHeight ?? double.infinity,
      ),
      margin: containerStyle.margin,
      alignment: containerStyle.alignment,
      decoration: BoxDecoration(
        borderRadius: containerStyle.borderRadius,
        border: containerStyle.border,
        color: containerStyle.color,
        boxShadow: containerStyle.withShadows ? containerStyle.boxShadow : null,
      ),
      child: RippleInkWell(
        onTap: config.onTap,
        rippleColor: rippleColor,
        borderRadius: containerStyle.borderRadius,
        child: Padding(
          padding: containerStyle.padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}

