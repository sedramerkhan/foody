import 'package:flutter/material.dart';

/// Configuration class for ClickableContainer that separates behavior from styling.
/// 
/// This class handles the functional configuration including callbacks and dimensions.
class ClickableContainerConfig {
  /// Callback when container is tapped
  final VoidCallback? onTap;

  /// Fixed width of the container
  final double? width;

  /// Fixed height of the container
  final double? height;

  /// Minimum width of the container
  final double? minWidth;

  /// Minimum height of the container
  final double? minHeight;

  /// Maximum width of the container
  final double? maxWidth;

  /// Maximum height of the container
  final double? maxHeight;

  const ClickableContainerConfig({
    this.onTap,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
  });

  /// Factory constructor for enabled clickable container
  factory ClickableContainerConfig.enabled({
    required VoidCallback onTap,
    double? width,
    double? height,
  }) {
    return ClickableContainerConfig(
      onTap: onTap,
      width: width,
      height: height,
    );
  }

  /// Factory constructor for non-clickable container
  factory ClickableContainerConfig.disabled({
    double? width,
    double? height,
  }) {
    return ClickableContainerConfig(
      onTap: null,
      width: width,
      height: height,
    );
  }

  /// Whether the container is clickable
  bool get isClickable => onTap != null;

  ClickableContainerConfig copyWith({
    VoidCallback? onTap,
    double? width,
    double? height,
    double? minWidth,
    double? minHeight,
    double? maxWidth,
    double? maxHeight,
  }) {
    return ClickableContainerConfig(
      onTap: onTap ?? this.onTap,
      width: width ?? this.width,
      height: height ?? this.height,
      minWidth: minWidth ?? this.minWidth,
      minHeight: minHeight ?? this.minHeight,
      maxWidth: maxWidth ?? this.maxWidth,
      maxHeight: maxHeight ?? this.maxHeight,
    );
  }
}

