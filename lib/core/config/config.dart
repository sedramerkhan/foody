
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/data/local/app_local_data.dart';

/// Global app configuration
class AppConfig extends ChangeNotifier {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  final AppLocalData _appLocalData = AppLocalData();
  
  /// Current language code (defaults to 'en')
  String _currentLanguageCode = 'en';
  
  /// Current theme mode (defaults to 'system')
  String _themeMode = 'system';
  
  /// Initialize language from storage
  Future<void> initLanguage() async {
    _currentLanguageCode = await _appLocalData.getLanguageCode();
    notifyListeners();
  }

  /// Initialize theme mode from storage
  Future<void> initThemeMode() async {
    _themeMode = await _appLocalData.getThemeMode();
    notifyListeners();
  }

  /// Get current language code
  String get currentLanguageCode => _currentLanguageCode;

  /// Get current locale
  Locale get currentLocale => Locale(_currentLanguageCode);

  /// Check if current language is Arabic
  bool get isArabic => _currentLanguageCode.startsWith('ar');

  /// Get current theme mode string ('dark', 'light', or 'system')
  String get themeModeString => _themeMode;

  /// Get ThemeMode enum for MaterialApp
  ThemeMode get themeMode {
    switch (_themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  /// Check if dark mode is active
  /// Returns true if mode is 'dark', false if 'light', or system brightness if 'system'
  bool isDark([BuildContext? context]) {
    switch (_themeMode) {
      case 'dark':
        return true;
      case 'light':
        return false;
      case 'system':
      default:
        // Check system brightness
        if (context != null) {
          final brightness = MediaQuery.platformBrightnessOf(context);
          return brightness == Brightness.dark;
        }
        // Fallback to window brightness if no context
        try {
          final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
          return brightness == Brightness.dark;
        } catch (e) {
          return false; // Default to light if can't determine
        }
    }
  }

  /// Set language code and save to storage
  Future<void> setLanguageCode(String languageCode) async {
    if (_currentLanguageCode != languageCode) {
      _currentLanguageCode = languageCode;
      await _appLocalData.setLanguageCode(languageCode);
      notifyListeners();
    }
  }

  /// Set theme mode and save to storage
  Future<void> setThemeMode(String themeMode) async {
    if (_themeMode != themeMode && (themeMode == 'dark' || themeMode == 'light' || themeMode == 'system')) {
      _themeMode = themeMode;
      await _appLocalData.setThemeMode(themeMode);
      notifyListeners();
    }
  }
}

/// Global access to current language code
String get currentLanguageCode => AppConfig().currentLanguageCode;

/// Global access to check if Arabic
bool get isArabic => AppConfig().isArabic;

/// Global access to check if dark mode
bool isDark([BuildContext? context]) => AppConfig().isDark(context);