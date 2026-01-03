// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  restaurantId: json['restaurant_id'] as String,
  nameAr: json['name_ar'] as String,
  nameEn: json['name_en'] as String,
  addressAr: json['address_ar'] as String,
  addressEn: json['address_en'] as String,
  phone: json['phone'] as String,
  rating: (json['rating'] as num).toDouble(),
  cuisineTypeAr: json['cuisine_type_ar'] as String,
  cuisineTypeEn: json['cuisine_type_en'] as String,
  imageUrl: json['image_url'],
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'address_ar': instance.addressAr,
      'address_en': instance.addressEn,
      'phone': instance.phone,
      'rating': instance.rating,
      'cuisine_type_ar': instance.cuisineTypeAr,
      'cuisine_type_en': instance.cuisineTypeEn,
      'image_url': instance.imageUrl,
    };
