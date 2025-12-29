// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Menu _$MenuFromJson(Map<String, dynamic> json) => _Menu(
  menuId: json['menu_id'] as String,
  restaurantId: json['restaurant_id'] as String,
  itemName: json['item_name'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  imageUrl: json['image_url'] as String,
  availabilityStatus: json['availability_status'] as bool? ?? true,
);

Map<String, dynamic> _$MenuToJson(_Menu instance) => <String, dynamic>{
  'menu_id': instance.menuId,
  'restaurant_id': instance.restaurantId,
  'item_name': instance.itemName,
  'description': instance.description,
  'price': instance.price,
  'image_url': instance.imageUrl,
  'availability_status': instance.availabilityStatus,
};
