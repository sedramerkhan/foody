import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foody/data/model/cart/cart_item.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';

part 'cart_data.freezed.dart';
part 'cart_data.g.dart';

@freezed
abstract class CartData with _$CartData {
  const CartData._();

  factory CartData({
    required List<CartItem> items,
    Restaurant? restaurant,
  }) = _CartData;

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  factory CartData.empty() => CartData(items: []);

  /// Convert to JSON string for Hive storage
  String toJsonString() {
    return jsonEncode(toJson());
  }

  /// Create from JSON string (for Hive storage)
  factory CartData.fromJsonString(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return CartData.fromJson(json);
    } catch (e) {
      return CartData.empty();
    }
  }

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
}

