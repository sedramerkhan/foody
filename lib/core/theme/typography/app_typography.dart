import 'package:flutter/material.dart';
import 'app_text_common.dart';

class AppTypography {
  final double fontSize;
  final FontWeight fontWeight;

  AppTypography._({required this.fontSize, required this.fontWeight});

  /// fontSize 28
  static AppTypography headingXLargeBold = AppTypography._(
    fontSize: AppFontSize.s28,
    fontWeight: AppFontWeight.semiBold600,
  );


  /// h1, fontSize 24
  static AppTypography headingLargeBold = AppTypography._(
    fontSize: AppFontSize.s24,
    fontWeight: AppFontWeight.semiBold600,
  );

  ///  fontSize 22
  static AppTypography headingMediumBold = AppTypography._(
    fontSize: AppFontSize.s22,
    fontWeight: AppFontWeight.medium500,
  );

  /// fontSize 20
  static AppTypography headingSmallBold = AppTypography._(
    fontSize: AppFontSize.s20,
    fontWeight: AppFontWeight.semiBold600,
  );

  /// fontSize 18
  static AppTypography headingXSmallBold = AppTypography._(
    fontSize: AppFontSize.s16,
    fontWeight: AppFontWeight.semiBold600,
  );

  /// fontSize 16
  static AppTypography bodyLargeRegular = AppTypography._(
    fontSize: AppFontSize.s16,
    fontWeight: AppFontWeight.regular400,
  );

  /// fontSize 16
  static AppTypography bodyLargeMedium = AppTypography._(
    fontSize: AppFontSize.s16,
    fontWeight: AppFontWeight.medium500,
  );

  /// fontSize 16
  static AppTypography bodyLargeSemiBold = AppTypography._(
    fontSize: AppFontSize.s16,
    fontWeight: AppFontWeight.semiBold600,
  );

  /// fontSize 14
  static AppTypography bodyMediumRegular = AppTypography._(
    fontSize: AppFontSize.s14,
    fontWeight: AppFontWeight.regular400,
  );

  /// fontSize 14
  static AppTypography bodyMediumMedium = AppTypography._(
    fontSize: AppFontSize.s14,
    fontWeight: AppFontWeight.medium500,
  );

  /// fontSize 14
  static AppTypography bodyMediumSemiBold = AppTypography._(
    fontSize: AppFontSize.s14,
    fontWeight: AppFontWeight.semiBold600,
  );

  /// fontSize 12
  static AppTypography bodySmallRegular = AppTypography._(
    fontSize: AppFontSize.s12,
    fontWeight: AppFontWeight.regular400,
  );

  /// fontSize 12
  static AppTypography bodySmallSemiBold = AppTypography._(
    fontSize: AppFontSize.s12,
    fontWeight: AppFontWeight.semiBold600,
  );

  /// fontSize 12
  static AppTypography bodySmallMedium = AppTypography._(
    fontSize: AppFontSize.s12,
    fontWeight: AppFontWeight.medium500,
  );

  /// fontSize 10
  static AppTypography bodyXSmallRegular = AppTypography._(
    fontSize: AppFontSize.s10,
    fontWeight: AppFontWeight.regular400,
  );

  /// fontSize 10
  static AppTypography bodyXSmallSemiBold = AppTypography._(
    fontSize: AppFontSize.s10,
    fontWeight: AppFontWeight.semiBold600,
  );

  /// fontSize 10
  static AppTypography bodyXSmallMedium = AppTypography._(
    fontSize: AppFontSize.s10,
    fontWeight: AppFontWeight.medium500,
  );

  /// fontSize 8
  static AppTypography bodyXXSmallMedium = AppTypography._(
    fontSize: AppFontSize.s8,
    fontWeight: AppFontWeight.medium500,
  );
}
