
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
  
  /// Initialize language from storage
  Future<void> initLanguage() async {
    _currentLanguageCode = await _appLocalData.getLanguageCode();
    notifyListeners();
  }

  /// Get current language code
  String get currentLanguageCode => _currentLanguageCode;

  /// Get current locale
  Locale get currentLocale => Locale(_currentLanguageCode);

  /// Check if current language is Arabic
  bool get isArabic => _currentLanguageCode.startsWith('ar');

  /// Set language code and save to storage
  Future<void> setLanguageCode(String languageCode) async {
    if (_currentLanguageCode != languageCode) {
      _currentLanguageCode = languageCode;
      await _appLocalData.setLanguageCode(languageCode);
      notifyListeners();
    }
  }
}

/// Global access to current language code
String get currentLanguageCode => AppConfig().currentLanguageCode;

/// Global access to check if Arabic
bool get isArabic => AppConfig().isArabic;