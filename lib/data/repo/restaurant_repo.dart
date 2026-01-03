import 'dart:async';
import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';

/// Repository for restaurant operations
class RestaurantRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Get all restaurants from Firebase
  Future<ApiResponse<List<Restaurant>>> getRestaurants() async {
    final response = await _databaseService.readList('restaurants');
    
    if (response.isFailure) {
      return response.mapData((_) => <Restaurant>[]);
    }

    final restaurantsList = response.getDataOrNull() ?? [];
    
    try {
      final restaurants = restaurantsList
          .map((json) => Restaurant.fromJson(json))
          .toList();
      return ApiResponse.success(restaurants);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to parse restaurants: ${e.toString()}',
      );
    }
  }

  /// Add a restaurant to Firebase
  Future<ApiResponse<String>> addRestaurant(Restaurant restaurant) async {
    final restaurantData = restaurant.toJson();
    // Use restaurant_id as the key
    final path = 'restaurants/${restaurant.restaurantId}';
    
    final response = await _databaseService.write(path, restaurantData);
    
    if (response.isFailure) {
      return response.mapData((_) => '');
    }
    
    return ApiResponse.success(restaurant.restaurantId);
  }

  /// Add multiple restaurants to Firebase
  Future<ApiResponse<void>> addRestaurants(List<Restaurant> restaurants) async {
    try {
      // Write each restaurant individually
      for (final restaurant in restaurants) {
        final response = await addRestaurant(restaurant);
        if (response.isFailure) {
          final failure = response as Failure;
          return ApiResponse.failure(
            message: 'Failed to add restaurant ${restaurant.name}: ${failure.message}',
          );
        }
      }
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to add restaurants: ${e.toString()}',
      );
    }
  }

  /// Mock data for testing (Syrian restaurants)
  static List<Restaurant> getSyrianRestaurants() {
    return [
      Restaurant(
        restaurantId: 'syrian_1',
        nameAr: 'مطعم الشام الأصيل',
        nameEn: 'Authentic Damascus Restaurant',
        addressAr: 'شارع الحمرا، دمشق، سوريا',
        addressEn: 'Hamra Street, Damascus, Syria',
        phone: '+963 11 234 5678',
        rating: 4.8,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_2',
        nameAr: 'مطعم أبو زيد',
        nameEn: 'Abu Zeid Restaurant',
        addressAr: 'شارع الميدان، دمشق، سوريا',
        addressEn: 'Midan Street, Damascus, Syria',
        phone: '+963 11 345 6789',
        rating: 4.7,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_3',
        nameAr: 'مطعم الكبابجي',
        nameEn: 'Kebabji Restaurant',
        addressAr: 'شارع بغداد، حلب، سوريا',
        addressEn: 'Baghdad Street, Aleppo, Syria',
        phone: '+963 21 456 7890',
        rating: 4.9,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_4',
        nameAr: 'مطعم الفروج المشوي',
        nameEn: 'Grilled Chicken Restaurant',
        addressAr: 'شارع الجمهورية، دمشق، سوريا',
        addressEn: 'Republic Street, Damascus, Syria',
        phone: '+963 11 567 8901',
        rating: 4.6,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_5',
        nameAr: 'مطعم الحمص والفلافل',
        nameEn: 'Hummus & Falafel Restaurant',
        addressAr: 'شارع الصالحية، دمشق، سوريا',
        addressEn: 'Salihiya Street, Damascus, Syria',
        phone: '+963 11 678 9012',
        rating: 4.5,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_6',
        nameAr: 'مطعم المنسف السوري',
        nameEn: 'Syrian Mansaf Restaurant',
        addressAr: 'شارع الجلاء، دمشق، سوريا',
        addressEn: 'Jalaa Street, Damascus, Syria',
        phone: '+963 11 789 0123',
        rating: 4.8,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_7',
        nameAr: 'مطعم الفتة والكبسة',
        nameEn: 'Fatteh & Kabsa Restaurant',
        addressAr: 'شارع الثورة، حلب، سوريا',
        addressEn: 'Revolution Street, Aleppo, Syria',
        phone: '+963 21 890 1234',
        rating: 4.7,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop',
      ),
      Restaurant(
        restaurantId: 'syrian_8',
        nameAr: 'مطعم المزة الشامية',
        nameEn: 'Shami Mezze Restaurant',
        addressAr: 'شارع أبو رمانة، دمشق، سوريا',
        addressEn: 'Abu Rummaneh Street, Damascus, Syria',
        phone: '+963 11 901 2345',
        rating: 4.9,
        cuisineTypeAr: 'سوري',
        cuisineTypeEn: 'Syrian',
        imageUrl: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&h=300&fit=crop',
      ),
    ];
  }
}

