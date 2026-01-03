// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  orderItemId: json['order_item_id'] as String,
  orderId: json['order_id'] as String,
  menuId: json['menu_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'order_item_id': instance.orderItemId,
      'order_id': instance.orderId,
      'menu_id': instance.menuId,
      'quantity': instance.quantity,
      'price': instance.price,
    };
