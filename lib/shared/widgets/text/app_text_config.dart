import 'package:flutter/material.dart';

/// Configuration class for AppText that separates behavior from styling.
/// 
/// This class handles the functional configuration of text widgets including
/// overflow handling and text alignment.
class AppTextConfig {
  /// Maximum number of lines
  final int? maxLines;

  /// How to handle text overflow
  final TextOverflow overflow;

  /// Text alignment
  final TextAlign textAlign;

  const AppTextConfig({
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
  });

  /// Factory constructor for single-line text
  factory AppTextConfig.singleLine() {
    return const AppTextConfig(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Factory constructor for multi-line text
  factory AppTextConfig.multiLine({int? maxLines}) {
    return AppTextConfig(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Factory constructor for unlimited lines
  factory AppTextConfig.unlimited() {
    return const AppTextConfig(
      maxLines: null,
      overflow: TextOverflow.visible,
    );
  }

  AppTextConfig copyWith({
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) {
    return AppTextConfig(
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      textAlign: textAlign ?? this.textAlign,
    );
  }
}

