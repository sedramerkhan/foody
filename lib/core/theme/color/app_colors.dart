import 'package:flutter/material.dart';
import 'package:foody/core/config/config.dart';

part 'theme_colors.dart';

class AppColors {

  // Helper to check if dark mode is active
  static bool get _isDark => AppConfig().isDark();

  // -----Background Surface------
  static Color get bgSurface => _isDark 
    ? ThemeColors.darkBgSurface.color 
    : ThemeColors.whiteMain.color;
  static Color get bgSurfaceSecondary => _isDark 
    ? ThemeColors.darkBgSurfaceSecondary.color 
    : ThemeColors.grey50.color;
  static final Color bgSurfaceBrand = ThemeColors.brand500.color;
  static Color get bgSurfaceBrandAlt => _isDark
    ? ThemeColors.darkBgFillSecondary.color
    : ThemeColors.brand25.color;

  // ----Background Fill -----
  static Color get bgFillPrimary => _isDark 
    ? ThemeColors.darkBgFillPrimary.color 
    : ThemeColors.grey50.color;
  static Color get bgFillSecondary => _isDark 
    ? ThemeColors.darkBgFillSecondary.color 
    : ThemeColors.grey100.color;
  static final Color bgFillBrand = ThemeColors.brand500.color;
  static Color get bgFillBrandAlt => _isDark
    ? ThemeColors.darkBgFillSecondary.color
    : ThemeColors.brand25.color;

  static final Color bgFillSuccess = ThemeColors.success500.color;
  static final Color bgFillSuccessAlt = ThemeColors.success50.color;
  static final Color bgFillError = ThemeColors.red500.color;
  static final Color bgFillErrorAlt = ThemeColors.red200.color;

  // -----Border ------
  static Color get borderPrimary => _isDark 
    ? ThemeColors.darkBorderPrimary.color 
    : ThemeColors.grey300.color;
  static Color get borderSecondary => _isDark 
    ? ThemeColors.darkBorderSecondary.color 
    : ThemeColors.grey400.color;
  static final Color borderBrand = ThemeColors.brand400.color;
  static final Color borderBrandAlt = ThemeColors.brand100.color;
  static final Color borderError = ThemeColors.red500.color;


  // -----Text  ------
  static Color get textPrimary => _isDark 
    ? ThemeColors.darkTextPrimary.color 
    : ThemeColors.grey500.color;
  static Color get textPrimaryAlt => _isDark 
    ? ThemeColors.darkTextPrimaryAlt.color 
    : ThemeColors.grey400.color;
  static Color get textSecondary => _isDark 
    ? ThemeColors.darkTextSecondary.color 
    : ThemeColors.grey700.color;
  static Color get textSecondaryAlt => _isDark 
    ? ThemeColors.darkTextSecondaryAlt.color 
    : ThemeColors.blackMain.color;
  static final Color textBrand = ThemeColors.brand500.color;
  static final Color textBrandAlt = ThemeColors.brand800.color;
  static final Color textOnBrand = ThemeColors.whiteMain.color;
  static final Color textError = ThemeColors.red500.color;



  // -----Button------
  static final Color buttonBrand = ThemeColors.brand500.color;
  static Color get buttonSecondary => _isDark
    ? ThemeColors.darkBgFillSecondary.color
    : ThemeColors.brand50.color;
  static final Color buttonLabelOnBrand = ThemeColors.whiteMain.color;
  static final Color buttonLabelBrand = ThemeColors.brand500.color;
  static final Color buttonDisabled = ThemeColors.brand500.color.withValues(alpha: .3);
  static final Color buttonLabelDisabled = ThemeColors.whiteMain.color;


  // ----Icon -----
  static Color get iconPrimary => _isDark 
    ? ThemeColors.darkIconPrimary.color 
    : ThemeColors.grey500.color;
  static Color get iconPrimaryAlt => _isDark 
    ? ThemeColors.darkIconPrimaryAlt.color 
    : ThemeColors.grey300.color;
  static final Color iconOnBrand = ThemeColors.whiteMain.color;
  static final Color iconBrand = ThemeColors.brand500.color;


  // ------- Gray Colors -------
  static Color get grey900 => _isDark 
    ? ThemeColors.darkGrey900.color 
    : ThemeColors.grey900.color;
  static Color get grey800 => _isDark 
    ? ThemeColors.darkGrey800.color 
    : ThemeColors.grey800.color;
  static Color get grey700 => _isDark 
    ? ThemeColors.darkGrey700.color 
    : ThemeColors.grey700.color;
  static Color get grey600 => _isDark 
    ? ThemeColors.darkGrey600.color 
    : ThemeColors.grey600.color;
  static Color get grey500 => _isDark 
    ? ThemeColors.darkGrey500.color 
    : ThemeColors.grey500.color;
  static Color get grey400 => _isDark 
    ? ThemeColors.darkGrey400.color 
    : ThemeColors.grey400.color;
  static Color get grey300 => _isDark 
    ? ThemeColors.darkGrey300.color 
    : ThemeColors.grey300.color;
  static Color get grey200 => _isDark 
    ? ThemeColors.darkGrey200.color 
    : ThemeColors.grey200.color;
  static Color get grey100 => _isDark 
    ? ThemeColors.darkGrey100.color 
    : ThemeColors.grey100.color;
  static Color get grey50 => _isDark 
    ? ThemeColors.darkGrey50.color 
    : ThemeColors.grey50.color;

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

  // ------- Dark Mode Color Helpers (for theme.dart) -------
  // These return dark colors directly, used when creating darkThemeData
  static Color get darkBgSurface => ThemeColors.darkBgSurface.color;
  static Color get darkBgSurfaceSecondary => ThemeColors.darkBgSurfaceSecondary.color;
  static Color get darkTextPrimary => ThemeColors.darkTextPrimary.color;
  static Color get darkTextPrimaryAlt => ThemeColors.darkTextPrimaryAlt.color;
  static Color get darkTextSecondary => ThemeColors.darkTextSecondary.color;
  static Color get darkTextSecondaryAlt => ThemeColors.darkTextSecondaryAlt.color;
  static Color get darkBorderPrimary => ThemeColors.darkBorderPrimary.color;
  static Color get darkBorderSecondary => ThemeColors.darkBorderSecondary.color;
  static Color get darkIconPrimary => ThemeColors.darkIconPrimary.color;
  static Color get darkIconPrimaryAlt => ThemeColors.darkIconPrimaryAlt.color;
  static Color get darkBgFillPrimary => ThemeColors.darkBgFillPrimary.color;
  static Color get darkBgFillSecondary => ThemeColors.darkBgFillSecondary.color;

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
