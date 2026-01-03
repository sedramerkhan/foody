import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foody/l10n/generated/l10n.dart';

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

extension OrderStatusExtension on OrderStatus {
  /// Get localized message for order status
  String getMessage() {
    final l10n = S.current;
    switch (this) {
      case OrderStatus.pending:
        return l10n.ordersOrderPlaced;
      case OrderStatus.confirmed:
        return l10n.ordersOrderConfirmed;
      case OrderStatus.delivered:
        return l10n.ordersOrderDelivered;
      case OrderStatus.canceled:
        return l10n.ordersOrderCanceled;
    }
  }
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

