// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartData _$CartDataFromJson(Map<String, dynamic> json) => _CartData(
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  restaurant: json['restaurant'] == null
      ? null
      : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartDataToJson(_CartData instance) => <String, dynamic>{
  'items': instance.items,
  'restaurant': instance.restaurant,
};
