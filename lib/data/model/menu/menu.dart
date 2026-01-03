import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foody/core/config/config.dart';

part 'menu.g.dart';
part 'menu.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  const Menu._();

  factory Menu({
    @JsonKey(name: 'menu_id') required String menuId,
    @JsonKey(name: 'restaurant_id') required String restaurantId,
    @JsonKey(name: 'item_name_ar') required String itemNameAr,
    @JsonKey(name: 'item_name_en') required String itemNameEn,
    @JsonKey(name: 'description_ar') required String descriptionAr,
    @JsonKey(name: 'description_en') required String descriptionEn,
    required double price,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'availability_status') @Default(true) bool availabilityStatus,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) =>
      _$MenuFromJson(json);

  /// Get item name based on current locale from AppConfig (fallback to English if not available)
  String get itemName => AppConfig().isArabic ? itemNameAr : itemNameEn;

  /// Get description based on current locale from AppConfig (fallback to English if not available)
  String get description => AppConfig().isArabic ? descriptionAr : descriptionEn;
}

