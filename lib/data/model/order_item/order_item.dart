import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const OrderItem._();

  factory OrderItem({
    @JsonKey(name: 'order_item_id') required String orderItemId,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'menu_id') required String menuId,
    required int quantity,
    required double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  double get totalPrice => price * quantity;
}

