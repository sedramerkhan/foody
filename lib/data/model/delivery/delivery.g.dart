// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Delivery _$DeliveryFromJson(Map<String, dynamic> json) => _Delivery(
  deliveryId: json['delivery_id'] as String,
  orderId: json['order_id'] as String,
  driverId: json['driver_id'] as String?,
  deliveryStatus: $enumDecode(_$DeliveryStatusEnumMap, json['delivery_status']),
  estimatedTime: (json['estimated_time'] as num?)?.toInt(),
  actualTime: json['actual_time'] == null
      ? null
      : DateTime.parse(json['actual_time'] as String),
);

Map<String, dynamic> _$DeliveryToJson(_Delivery instance) => <String, dynamic>{
  'delivery_id': instance.deliveryId,
  'order_id': instance.orderId,
  'driver_id': instance.driverId,
  'delivery_status': _$DeliveryStatusEnumMap[instance.deliveryStatus]!,
  'estimated_time': instance.estimatedTime,
  'actual_time': instance.actualTime?.toIso8601String(),
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.assigned: 'assigned',
  DeliveryStatus.onTheWay: 'on_the_way',
  DeliveryStatus.delivered: 'delivered',
};
