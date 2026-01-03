import 'dart:convert';
import 'package:foody/core/data/local/hive/base_local_data.dart';
import 'package:foody/data/model/user/user.dart';
import 'package:foody/data/model/cart/cart_data.dart';

/// Storage keys for app local data
class AppLocalDataKeys {
  static const String userBox = 'user_data';
  static const String userInfo = 'user_info';
  static const String isAuthenticated = 'is_authenticated';
  static const String appSettingsBox = 'app_settings';
  static const String languageCode = 'language_code';
  static const String cartBox = 'cart_data';
  static const String cartInfo = 'cart_info';
}

/// App local data storage using BaseLocalData
/// 
/// This class provides typed access to local storage using Hive
/// through the BaseLocalData abstraction layer.
/// 
/// User model uses a custom Hive TypeAdapter for direct storage.
class AppLocalData {
  static final AppLocalData _instance = AppLocalData._internal();
  factory AppLocalData() => _instance;
  AppLocalData._internal();

  /// User data storage (uses Hive TypeAdapter)
  final BaseLocalData<User> user = BaseLocalData<User>(
    boxName: AppLocalDataKeys.userBox,
    keyName: AppLocalDataKeys.userInfo,
  );

  /// Language code storage
  final BaseLocalData<String> languageCode = BaseLocalData<String>(
    boxName: AppLocalDataKeys.appSettingsBox,
    keyName: AppLocalDataKeys.languageCode,
  );

  /// Cart data storage (as JSON string)
  final BaseLocalData<String> cartData = BaseLocalData<String>(
    boxName: AppLocalDataKeys.cartBox,
    keyName: AppLocalDataKeys.cartInfo,
  );

  /// Store language code
  Future<void> setLanguageCode(String languageCode) async {
    await this.languageCode.storeData(languageCode);
  }

  /// Get stored language code (defaults to 'en')
  Future<String> getLanguageCode() async {
    return await languageCode.getData() ?? 'en';
  }

  /// Store cart data
  Future<void> storeCart(CartData cart) async {
    await cartData.storeData(cart.toJsonString());
  }

  /// Get stored cart data
  Future<CartData> getCart() async {
    final jsonString = await cartData.getData();
    if (jsonString == null) {
      return CartData.empty();
    }
    return CartData.fromJsonString(jsonString);
  }

  /// Clear cart data
  Future<void> clearCart() async {
    await cartData.deleteData();
  }

  /// Clear all user data
  Future<void> clearUserData() async {
    await user.deleteData();
  }
}

