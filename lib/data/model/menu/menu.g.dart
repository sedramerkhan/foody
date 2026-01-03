// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Menu _$MenuFromJson(Map<String, dynamic> json) => _Menu(
  menuId: json['menu_id'] as String,
  restaurantId: json['restaurant_id'] as String,
  itemNameAr: json['item_name_ar'] as String,
  itemNameEn: json['item_name_en'] as String,
  descriptionAr: json['description_ar'] as String,
  descriptionEn: json['description_en'] as String,
  price: (json['price'] as num).toDouble(),
  imageUrl: json['image_url'] as String,
  availabilityStatus: json['availability_status'] as bool? ?? true,
);

Map<String, dynamic> _$MenuToJson(_Menu instance) => <String, dynamic>{
  'menu_id': instance.menuId,
  'restaurant_id': instance.restaurantId,
  'item_name_ar': instance.itemNameAr,
  'item_name_en': instance.itemNameEn,
  'description_ar': instance.descriptionAr,
  'description_en': instance.descriptionEn,
  'price': instance.price,
  'image_url': instance.imageUrl,
  'availability_status': instance.availabilityStatus,
};
