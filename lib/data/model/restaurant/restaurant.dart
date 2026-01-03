import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foody/core/config/config.dart';

part 'restaurant.g.dart';
part 'restaurant.freezed.dart';

@freezed
abstract class Restaurant with _$Restaurant {
  const Restaurant._();

  factory Restaurant({
    @JsonKey(name: 'restaurant_id') required String restaurantId,
    @JsonKey(name: 'name_ar') required String nameAr,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'address_ar') required String addressAr,
    @JsonKey(name: 'address_en') required String addressEn,
    required String phone,
    required double rating,
    @JsonKey(name: 'cuisine_type_ar') required String cuisineTypeAr,
    @JsonKey(name: 'cuisine_type_en') required String cuisineTypeEn,
    @JsonKey(name: 'image_url') required imageUrl,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  /// Get name based on current locale from AppConfig (fallback to English if not available)
  String get name => AppConfig().isArabic ? nameAr : nameEn;

  /// Get address based on current locale from AppConfig (fallback to English if not available)
  String get address => AppConfig().isArabic ? addressAr : addressEn;

  /// Get cuisine type based on current locale from AppConfig (fallback to English if not available)
  String get cuisineType => AppConfig().isArabic ? cuisineTypeAr : cuisineTypeEn;
}

