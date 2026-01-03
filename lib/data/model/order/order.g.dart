// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  orderId: json['order_id'] as String,
  userId: json['user_id'] as String,
  restaurantId: json['restaurant_id'] as String,
  orderStatus: $enumDecode(_$OrderStatusEnumMap, json['order_status']),
  totalAmount: (json['total_amount'] as num).toDouble(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'order_id': instance.orderId,
  'user_id': instance.userId,
  'restaurant_id': instance.restaurantId,
  'order_status': _$OrderStatusEnumMap[instance.orderStatus]!,
  'total_amount': instance.totalAmount,
  'created_at': instance.createdAt.toIso8601String(),
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.delivered: 'delivered',
  OrderStatus.canceled: 'canceled',
};
