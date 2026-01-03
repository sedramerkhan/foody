import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foody/data/model/menu/menu.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  factory CartItem({
    required Menu menuItem,
    required int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  double get totalPrice => menuItem.price * quantity;
}

