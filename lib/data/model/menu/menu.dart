import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.g.dart';
part 'menu.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  const Menu._();

  factory Menu({
    @JsonKey(name: 'menu_id') required String menuId,
    @JsonKey(name: 'restaurant_id') required String restaurantId,
    @JsonKey(name: 'item_name') required String itemName,
    required String description,
    required double price,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'availability_status') @Default(true) bool availabilityStatus,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) =>
      _$MenuFromJson(json);
}

