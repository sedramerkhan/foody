import 'dart:async';
import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/menu/menu.dart';

/// Repository for menu operations
class MenuRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Get menu items for a restaurant from Firebase
  Future<ApiResponse<List<Menu>>> getMenuItems(String restaurantId) async {
    final response = await _databaseService.readList('menus/$restaurantId');
    
    if (response.isFailure) {
      return response.mapData((_) => <Menu>[]);
    }

    final menuList = response.getDataOrNull() ?? [];
    
    try {
      final menuItems = menuList
          .where((json) => json is Map<String, dynamic>)
          .map((json) => Menu.fromJson(json as Map<String, dynamic>))
          .toList();
      return ApiResponse.success(menuItems);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to parse menu items: ${e.toString()}',
      );
    }
  }

  /// Add a menu item to Firebase
  Future<ApiResponse<String>> addMenuItem(Menu menuItem) async {
    final menuData = menuItem.toJson();
    final path = 'menus/${menuItem.restaurantId}/${menuItem.menuId}';
    
    final response = await _databaseService.write(path, menuData);
    
    if (response.isFailure) {
      return response.mapData((_) => '');
    }
    
    return ApiResponse.success(menuItem.menuId);
  }

  /// Add multiple menu items to Firebase
  Future<ApiResponse<void>> addMenuItems(List<Menu> menuItems) async {
    try {
      for (final menuItem in menuItems) {
        final response = await addMenuItem(menuItem);
        if (response.isFailure) {
          final failure = response as Failure;
          return ApiResponse.failure(
            message: 'Failed to add menu item ${menuItem.itemNameEn}: ${failure.message}',
          );
        }
      }
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to add menu items: ${e.toString()}',
      );
    }
  }

  /// Get Syrian menu items for a restaurant
  static List<Menu> getSyrianMenuItems(String restaurantId) {
    switch (restaurantId) {
      case 'syrian_1': // مطعم الشام الأصيل
        return [
          Menu(
            menuId: 'syrian_1_m1',
            restaurantId: 'syrian_1',
            itemNameAr: 'كباب حلب',
            itemNameEn: 'Aleppo Kebab',
            descriptionAr: 'كباب مشوي على الفحم مع الأرز والسلطة',
            descriptionEn: 'Grilled kebab on charcoal with rice and salad',
            price: 25.00,
            imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_1_m2',
            restaurantId: 'syrian_1',
            itemNameAr: 'شاورما لحم',
            itemNameEn: 'Beef Shawarma',
            descriptionAr: 'شاورما لحم طازجة مع الثوم والطماطم',
            descriptionEn: 'Fresh beef shawarma with garlic and tomatoes',
            price: 18.00,
            imageUrl: 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_1_m3',
            restaurantId: 'syrian_1',
            itemNameAr: 'فتة حمص',
            itemNameEn: 'Hummus Fatteh',
            descriptionAr: 'حمص مع الخبز المحمص والصنوبر',
            descriptionEn: 'Hummus with toasted bread and pine nuts',
            price: 12.00,
            imageUrl: 'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_1_m4',
            restaurantId: 'syrian_1',
            itemNameAr: 'منسف',
            itemNameEn: 'Mansaf',
            descriptionAr: 'لحم ضأن مع الأرز واللبن',
            descriptionEn: 'Lamb with rice and yogurt',
            price: 30.00,
            imageUrl: 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_2': // مطعم أبو زيد
        return [
          Menu(
            menuId: 'syrian_2_m1',
            restaurantId: 'syrian_2',
            itemNameAr: 'مشاوي مشكلة',
            itemNameEn: 'Mixed Grill',
            descriptionAr: 'تشكيلة من المشاوي (كباب، كفتة، شيش طاووق)',
            descriptionEn: 'Assortment of grilled meats (kebab, kofta, shish tawook)',
            price: 35.00,
            imageUrl: 'https://images.unsplash.com/photo-1558030006-450675393462?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_2_m2',
            restaurantId: 'syrian_2',
            itemNameAr: 'كبسة دجاج',
            itemNameEn: 'Chicken Kabsa',
            descriptionAr: 'أرز مع دجاج متبل ومطبوخ بالبهارات',
            descriptionEn: 'Rice with spiced and cooked chicken',
            price: 22.00,
            imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_2_m3',
            restaurantId: 'syrian_2',
            itemNameAr: 'فتوش',
            itemNameEn: 'Fattoush',
            descriptionAr: 'سلطة خضار مع الخبز المحمص',
            descriptionEn: 'Vegetable salad with toasted bread',
            price: 10.00,
            imageUrl: 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_3': // مطعم الكبابجي
        return [
          Menu(
            menuId: 'syrian_3_m1',
            restaurantId: 'syrian_3',
            itemNameAr: 'كباب مشوي',
            itemNameEn: 'Grilled Kebab',
            descriptionAr: 'كباب لحم طازج مشوي على الفحم',
            descriptionEn: 'Fresh meat kebab grilled on charcoal',
            price: 28.00,
            imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_3_m2',
            restaurantId: 'syrian_3',
            itemNameAr: 'كفتة',
            itemNameEn: 'Kofta',
            descriptionAr: 'كفتة لحم مع البصل والبهارات',
            descriptionEn: 'Meat kofta with onions and spices',
            price: 24.00,
            imageUrl: 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_3_m3',
            restaurantId: 'syrian_3',
            itemNameAr: 'شيش طاووق',
            itemNameEn: 'Shish Tawook',
            descriptionAr: 'دجاج مشوي مع الثوم والليمون',
            descriptionEn: 'Grilled chicken with garlic and lemon',
            price: 20.00,
            imageUrl: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_4': // مطعم الفروج المشوي
        return [
          Menu(
            menuId: 'syrian_4_m1',
            restaurantId: 'syrian_4',
            itemNameAr: 'فرج مشوي كامل',
            itemNameEn: 'Whole Grilled Chicken',
            descriptionAr: 'دجاج كامل مشوي مع البطاطا',
            descriptionEn: 'Whole grilled chicken with potatoes',
            price: 32.00,
            imageUrl: 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_4_m2',
            restaurantId: 'syrian_4',
            itemNameAr: 'صدر دجاج مشوي',
            itemNameEn: 'Grilled Chicken Breast',
            descriptionAr: 'صدر دجاج مشوي مع الأرز',
            descriptionEn: 'Grilled chicken breast with rice',
            price: 18.00,
            imageUrl: 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_5': // مطعم الحمص والفلافل
        return [
          Menu(
            menuId: 'syrian_5_m1',
            restaurantId: 'syrian_5',
            itemNameAr: 'حمص بالطحينة',
            itemNameEn: 'Hummus with Tahini',
            descriptionAr: 'حمص طازج مع الطحينة وزيت الزيتون',
            descriptionEn: 'Fresh hummus with tahini and olive oil',
            price: 8.00,
            imageUrl: 'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_5_m2',
            restaurantId: 'syrian_5',
            itemNameAr: 'فلافل',
            itemNameEn: 'Falafel',
            descriptionAr: 'فلافل مقرمش مع السلطة والطحينة',
            descriptionEn: 'Crispy falafel with salad and tahini',
            price: 6.00,
            imageUrl: 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_5_m3',
            restaurantId: 'syrian_5',
            itemNameAr: 'مسقعة',
            itemNameEn: 'Moussaka',
            descriptionAr: 'باذنجان مع اللحم والطماطم',
            descriptionEn: 'Eggplant with meat and tomatoes',
            price: 15.00,
            imageUrl: 'https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_6': // مطعم المنسف السوري
        return [
          Menu(
            menuId: 'syrian_6_m1',
            restaurantId: 'syrian_6',
            itemNameAr: 'منسف لحم',
            itemNameEn: 'Lamb Mansaf',
            descriptionAr: 'لحم ضأن مع الأرز واللبن والصنوبر',
            descriptionEn: 'Lamb with rice, yogurt, and pine nuts',
            price: 35.00,
            imageUrl: 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_6_m2',
            restaurantId: 'syrian_6',
            itemNameAr: 'منسف دجاج',
            itemNameEn: 'Chicken Mansaf',
            descriptionAr: 'دجاج مع الأرز واللبن',
            descriptionEn: 'Chicken with rice and yogurt',
            price: 25.00,
            imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_7': // مطعم الفتة والكبسة
        return [
          Menu(
            menuId: 'syrian_7_m1',
            restaurantId: 'syrian_7',
            itemNameAr: 'فتة لحم',
            itemNameEn: 'Meat Fatteh',
            descriptionAr: 'لحم مع الخبز المحمص واللبن',
            descriptionEn: 'Meat with toasted bread and yogurt',
            price: 20.00,
            imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_7_m2',
            restaurantId: 'syrian_7',
            itemNameAr: 'كبسة لحم',
            itemNameEn: 'Meat Kabsa',
            descriptionAr: 'أرز مع لحم متبل',
            descriptionEn: 'Rice with spiced meat',
            price: 28.00,
            imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_7_m3',
            restaurantId: 'syrian_7',
            itemNameAr: 'فتة دجاج',
            itemNameEn: 'Chicken Fatteh',
            descriptionAr: 'دجاج مع الخبز المحمص واللبن',
            descriptionEn: 'Chicken with toasted bread and yogurt',
            price: 18.00,
            imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      case 'syrian_8': // مطعم المزة الشامية
        return [
          Menu(
            menuId: 'syrian_8_m1',
            restaurantId: 'syrian_8',
            itemNameAr: 'مزة شامية كاملة',
            itemNameEn: 'Complete Shami Mezze',
            descriptionAr: 'تشكيلة من المقبلات الشامية (حمص، بابا غنوج، تبولة، فول)',
            descriptionEn: 'Assortment of Shami appetizers (hummus, baba ganoush, tabbouleh, fava beans)',
            price: 25.00,
            imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_8_m2',
            restaurantId: 'syrian_8',
            itemNameAr: 'بابا غنوج',
            itemNameEn: 'Baba Ganoush',
            descriptionAr: 'باذنجان مشوي مع الطحينة',
            descriptionEn: 'Grilled eggplant with tahini',
            price: 10.00,
            imageUrl: 'https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_8_m3',
            restaurantId: 'syrian_8',
            itemNameAr: 'تبولة',
            itemNameEn: 'Tabbouleh',
            descriptionAr: 'سلطة برغل مع البقدونس والطماطم',
            descriptionEn: 'Bulgar salad with parsley and tomatoes',
            price: 8.00,
            imageUrl: 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'syrian_8_m4',
            restaurantId: 'syrian_8',
            itemNameAr: 'فول بالزيت',
            itemNameEn: 'Fava Beans with Oil',
            descriptionAr: 'فول مطبوخ مع زيت الزيتون والليمون',
            descriptionEn: 'Cooked fava beans with olive oil and lemon',
            price: 7.00,
            imageUrl: 'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=300&h=200&fit=crop',
            availabilityStatus: true,
          ),
        ];

      default:
        return [];
    }
  }
}

