import 'package:flutter/material.dart';

/// Configuration class for AppButton that separates behavior from styling.
/// 
/// This class handles the functional configuration of a button including
/// callbacks, loading state, and enabled/disabled state.
class AppButtonConfig {
  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool enabled;

  /// Minimum width of the button
  final double? minWidth;

  /// Fixed width of the button
  final double? width;

  /// Height of the button
  final double? height;

  const AppButtonConfig({
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.minWidth,
    this.width,
    this.height,
  });

  /// Factory constructor for enabled button
  factory AppButtonConfig.enabled({
    required VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    double? height,
  }) {
    return AppButtonConfig(
      onPressed: onPressed,
      isLoading: isLoading,
      enabled: true,
      width: width,
      height: height,
    );
  }

  /// Factory constructor for disabled button
  factory AppButtonConfig.disabled({
    double? width,
    double? height,
  }) {
    return AppButtonConfig(
      onPressed: null,
      isLoading: false,
      enabled: false,
      width: width,
      height: height,
    );
  }

  /// Factory constructor for loading button
  factory AppButtonConfig.loading({
    double? width,
    double? height,
  }) {
    return AppButtonConfig(
      onPressed: null,
      isLoading: true,
      enabled: false,
      width: width,
      height: height,
    );
  }

  /// Whether the button can be pressed
  bool get canPress => enabled && !isLoading && onPressed != null;

  AppButtonConfig copyWith({
    VoidCallback? onPressed,
    bool? isLoading,
    bool? enabled,
    double? minWidth,
    double? width,
    double? height,
  }) {
    return AppButtonConfig(
      onPressed: onPressed ?? this.onPressed,
      isLoading: isLoading ?? this.isLoading,
      enabled: enabled ?? this.enabled,
      minWidth: minWidth ?? this.minWidth,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}

