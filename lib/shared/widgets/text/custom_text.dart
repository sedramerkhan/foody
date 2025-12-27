import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';

/// @deprecated Use [AppText] instead. This class will be removed in a future version.
/// 
/// Migration guide:
/// ```dart
/// // Old:
/// CustomText(
///   'Hello World',
///   typography: AppTypography.bodyLargeMedium,
///   color: AppColors.textPrimary,
/// )
/// 
/// // New:
/// AppText(
///   config: AppTextConfig.singleLine('Hello World'),
///   style: AppTextStyle.primary(),
/// )
/// 
/// // Or simpler:
/// AppText.simple('Hello World', color: AppColors.textPrimary)
/// ```
@Deprecated('Use AppText instead')
class CustomText extends StatelessWidget {
  const CustomText(
    this.data, {
    super.key,
     this.typography,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.textDecoration = TextDecoration.none,
  });

  final String data;
  final AppTypography? typography;
  final Color? color;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final int? maxLines;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: ThemeTextStyle.fromTypography(
              typography: typography ?? AppTypography.bodyLargeMedium,
              color: color ?? AppColors.textSecondaryAlt,
            )
          .copyWith(textDecoration: textDecoration)
          .materialTextStyle,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
