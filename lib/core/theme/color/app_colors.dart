import 'package:flutter/material.dart';

part 'theme_colors.dart';

class AppColors {



  // -----Background Surface------
  static final Color bgSurface = ThemeColors.whiteMain.color;
  static final Color bgSurfaceSecondary = ThemeColors.grey50.color;
  static final Color bgSurfaceBrand = ThemeColors.brand500.color;
  static final Color bgSurfaceBrandAlt = ThemeColors.brand25.color;

  // ----Background Fill -----
  static final Color bgFillPrimary = ThemeColors.grey50.color;
  static final Color bgFillSecondary = ThemeColors.grey100.color;
  static final Color bgFillBrand = ThemeColors.brand500.color;
  static final Color bgFillBrandAlt = ThemeColors.brand25.color;

  static final Color bgFillSuccess = ThemeColors.success500.color;
  static final Color bgFillSuccessAlt = ThemeColors.success50.color;
  static final Color bgFillError = ThemeColors.red500.color;
  static final Color bgFillErrorAlt = ThemeColors.red200.color;

  // -----Border ------
  static final Color borderPrimary = ThemeColors.grey300.color;
  static final Color borderSecondary = ThemeColors.grey400.color;
  static final Color borderBrand = ThemeColors.brand400.color;
  static final Color borderBrandAlt = ThemeColors.brand100.color;
  static final Color borderError = ThemeColors.red500.color;


  // -----Text  ------
  static final Color textPrimary = ThemeColors.grey500.color;
  static final Color textPrimaryAlt = ThemeColors.grey400.color;
  static final Color textSecondary = ThemeColors.grey700.color;
  static final Color textSecondaryAlt = ThemeColors.blackMain.color;
  static final Color textBrand = ThemeColors.brand500.color;
  static final Color textBrandAlt = ThemeColors.brand800.color;
  static final Color textOnBrand = ThemeColors.whiteMain.color;
  static final Color textError = ThemeColors.red500.color;



  // -----Button------
  static final Color buttonBrand = ThemeColors.brand500.color;
  static final Color buttonSecondary = ThemeColors.brand50.color;
  static final Color buttonLabelOnBrand = ThemeColors.whiteMain.color;
  static final Color buttonLabelBrand = ThemeColors.brand500.color;
  static final Color buttonDisabled = ThemeColors.brand500.color.withValues(alpha: .3);
  static final Color buttonLabelDisabled = ThemeColors.whiteMain.color;


  // ----Icon -----
  static final Color iconPrimary = ThemeColors.grey500.color;
  static final Color iconPrimaryAlt = ThemeColors.grey300.color;
  static final Color iconOnBrand = ThemeColors.whiteMain.color;
  static final Color iconBrand = ThemeColors.brand500.color;


  // ------- Gray Colors -------
  static final Color grey900 = ThemeColors.grey900.color;
  static final Color grey800 = ThemeColors.grey800.color;
  static final Color grey700 = ThemeColors.grey700.color;
  static final Color grey600 = ThemeColors.grey600.color;
  static final Color grey500 = ThemeColors.grey500.color;
  static final Color grey400 = ThemeColors.grey400.color;
  static final Color grey300 = ThemeColors.grey300.color;
  static final Color grey200 = ThemeColors.grey200.color;
  static final Color grey100 = ThemeColors.grey100.color;
  static final Color grey50 = ThemeColors.grey50.color;

  // ------- Brand Colors -------
  static final Color brand700 = ThemeColors.brand700.color;
  static final Color brand600 = ThemeColors.brand600.color;
  static final Color brand500 = ThemeColors.brand500.color;
  static final Color brand400 = ThemeColors.brand400.color;
  static final Color brand300 = ThemeColors.brand300.color;
  static final Color brand200 = ThemeColors.brand200.color;
  static final Color brand100 = ThemeColors.brand100.color;
  static final Color brand50 = ThemeColors.brand50.color;
  static final Color brand25 = ThemeColors.brand25.color;

  // ------- Secondary Colors -------
  static final Color secondary = ThemeColors.secondary.color;
  static final Color secondary700 = ThemeColors.secondary700.color;
  static final Color secondary500 = ThemeColors.secondary500.color;
  static final Color secondary300 = ThemeColors.secondary300.color;
  static final Color secondary100 = ThemeColors.secondary100.color;

  static final Color white = ThemeColors.whiteMain.color;
  static final Color black = ThemeColors.blackMain.color;


  // ------- Red Colors -------
  static final Color red700 = ThemeColors.red700.color;
  static final Color red500 = ThemeColors.red500.color;
  static final Color red400 = ThemeColors.red400.color;
  static final Color red300 = ThemeColors.red300.color;
  static final Color red200 = ThemeColors.red200.color;
  static final Color red50 = ThemeColors.red50.color;

  // ------- Rating/Star -------
  static final Color star = ThemeColors.star.color;


  // ------- Success Colors -------
  static final Color success50 = ThemeColors.success50.color;
  static final Color success500 = ThemeColors.success500.color;
  static final Color success700 = ThemeColors.success700.color;




  static bool isLightHex(String hexColor) {
    final color = int.parse(hexColor.substring(1),
        radix: 16); // remove the '#' and parse hex
    final r = (color >> 16) & 0xFF;
    final g = (color >> 8) & 0xFF;
    final b = color & 0xFF;

    final yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
    return yiq >= 128;
  }


  static bool isLightColor(Color color) {
    //r b g are not working fine
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    // YIQ formula for lightness detection
    final yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
    return yiq >= 128;
  }


  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    final color = int.parse(hexColor, radix: 16);
    return Color(color);
  }
}
