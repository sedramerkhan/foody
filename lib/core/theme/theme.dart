import 'color/app_colors.dart';
import 'typography/app_font_size.dart';
import 'typography/app_font_weight.dart';
import 'typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';

import 'package:flutter/material.dart';


//todo:set font
const String defaultFontFamily = '';


///App Theme
ThemeData defaultThemeData = ThemeData(
  fontFamily: defaultFontFamily,
  // brightness: Brightness.dark,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.bgSurface,
  useMaterial3: true,
  pageTransitionsTheme: const PageTransitionsTheme(),

  /// Date Picker
  datePickerTheme: DatePickerThemeData(
    headerHeadlineStyle: ThemeTextStyle.fromTypography(
      typography: AppTypography.headingXSmallBold,
      color: AppColors.textPrimary,
    ).materialTextStyle,
    weekdayStyle: ThemeTextStyle.fromTypography(
      typography: AppTypography.bodyMediumMedium,
      color: AppColors.textBrand,
    ).materialTextStyle,
    dayStyle: ThemeTextStyle.fromTypography(
      typography: AppTypography.bodyMediumRegular,
      color: AppColors.textSecondaryAlt,
    ).materialTextStyle,
    yearStyle: ThemeTextStyle.fromTypography(
      typography: AppTypography.bodyMediumRegular,
      color: AppColors.textSecondaryAlt,
    ).materialTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
   // hourMinuteTextColor: Colors.teal,
    dialHandColor: AppColors.brand300,
    dialBackgroundColor: Colors.transparent,
  ),

  /// Color Scheme - Food Delivery Theme
  /// Primary: Warm orange-red for appetite and energy
  /// Secondary: Warm yellow for highlights and accents
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.brand500, // Warm orange-red (main brand)
    onPrimary: Colors.white,
    secondary: AppColors.secondary500, // Warm yellow (complementary)
    onSecondary: AppColors.black,
    tertiary: AppColors.success500, // Success/fresh green
    error: AppColors.red500,
    onError: Colors.white,
    surface: AppColors.bgSurface,
    onSurface: AppColors.textPrimary,
    outline: AppColors.borderPrimary,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.brand600,
    selectionHandleColor: Colors.transparent, // Hide the green teardrop selection handles
  ),

  /// Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.bgSurfaceSecondary,
    labelStyle: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.s16,
      fontWeight: AppFontWeight.semiBold600,
    ),
    selectedColor: AppColors.bgFillBrand,
  ),

  /// Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: AppColors.bgSurfaceSecondary,
    filled: true,
    focusColor: AppColors.bgFillBrand,

    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: AppColors.grey100,
    //     width: 1.0,
    //   ),
    //   borderRadius: const BorderRadius.all(
    //     Radius.circular(8),
    //   ),
    // ),
    hintStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: AppFontSize.s14,
      fontWeight: AppFontWeight.regular400,
    ),
    errorStyle: TextStyle(
      color: AppColors.bgFillError,
      fontWeight: AppFontWeight.medium500,
      fontSize: AppFontSize.s10,
    ),
  ),
  hintColor: AppColors.textPrimary,
);

