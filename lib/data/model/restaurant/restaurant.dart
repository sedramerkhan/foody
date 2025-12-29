import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.g.dart';
part 'restaurant.freezed.dart';

@freezed
abstract class Restaurant with _$Restaurant {
  const Restaurant._();

  factory Restaurant({
    @JsonKey(name: 'restaurant_id') required String restaurantId,
    required String name,
    required String address,
    required String phone,
    required double rating,
    @JsonKey(name: 'cuisine_type') required String cuisineType,
    @JsonKey(name: 'image_url') required imageUrl,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

