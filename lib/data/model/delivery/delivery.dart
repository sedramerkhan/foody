import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

enum DeliveryStatus {
  @JsonValue('assigned')
  assigned,
  @JsonValue('on_the_way')
  onTheWay,
  @JsonValue('delivered')
  delivered,
}

@freezed
abstract class Delivery with _$Delivery {
  const Delivery._();

  factory Delivery({
    @JsonKey(name: 'delivery_id') required String deliveryId,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'driver_id') String? driverId,
    @JsonKey(name: 'delivery_status') required DeliveryStatus deliveryStatus,
    @JsonKey(name: 'estimated_time') int? estimatedTime, // in minutes
    @JsonKey(name: 'actual_time') DateTime? actualTime,
  }) = _Delivery;

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);
}

