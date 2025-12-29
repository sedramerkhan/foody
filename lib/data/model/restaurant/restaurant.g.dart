// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  restaurantId: json['restaurant_id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  phone: json['phone'] as String,
  rating: (json['rating'] as num).toDouble(),
  cuisineType: json['cuisine_type'] as String,
  imageUrl: json['image_url'],
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'rating': instance.rating,
      'cuisine_type': instance.cuisineType,
      'image_url': instance.imageUrl,
    };
