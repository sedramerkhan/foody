import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('delivered')
  delivered,
  @JsonValue('canceled')
  canceled,
}

@freezed
abstract class Order with _$Order {
  const Order._();

  factory Order({
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'restaurant_id') required String restaurantId,
    @JsonKey(name: 'order_status') required OrderStatus orderStatus,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

