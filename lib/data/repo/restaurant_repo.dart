import 'dart:async';
import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';

/// Repository for restaurant operations
class RestaurantRepo extends BaseRepository {
  /// Get all restaurants (mock data)
  Future<ApiResponse<List<Restaurant>>> getRestaurants() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Mock restaurant data
    final restaurants = [
      Restaurant(
        restaurantId: '1',
        name: 'Bella Italia',
        address: '123 Main Street, Downtown',
        phone: '+1 (555) 123-4567',
        rating: 4.5,
        cuisineType: 'Italian',
        imageUrl: 'https://picsum.photos/seed/bella-italia/400/300',
      ),
      Restaurant(
        restaurantId: '2',
        name: 'Dragon Palace',
        address: '456 Oak Avenue, Chinatown',
        phone: '+1 (555) 234-5678',
        rating: 4.7,
        cuisineType: 'Chinese',
        imageUrl: 'https://picsum.photos/seed/dragon-palace/400/300',
      ),
      Restaurant(
        restaurantId: '3',
        name: 'Taco Fiesta',
        address: '789 Elm Street, Midtown',
        phone: '+1 (555) 345-6789',
        rating: 4.3,
        cuisineType: 'Mexican',
        imageUrl: 'https://picsum.photos/seed/taco-fiesta/400/300',
      ),
      Restaurant(
        restaurantId: '4',
        name: 'Spice Garden',
        address: '321 Pine Road, Uptown',
        phone: '+1 (555) 456-7890',
        rating: 4.6,
        cuisineType: 'Indian',
        imageUrl: 'https://picsum.photos/seed/spice-garden/400/300',
      ),
      Restaurant(
        restaurantId: '5',
        name: 'Sushi Zen',
        address: '654 Maple Drive, Harbor District',
        phone: '+1 (555) 567-8901',
        rating: 4.8,
        cuisineType: 'Japanese',
        imageUrl: 'https://picsum.photos/seed/sushi-zen/400/300',
      ),
      Restaurant(
        restaurantId: '6',
        name: 'Le Bistro',
        address: '987 Cedar Lane, French Quarter',
        phone: '+1 (555) 678-9012',
        rating: 4.4,
        cuisineType: 'French',
        imageUrl: 'https://picsum.photos/seed/le-bistro/400/300',
      ),
      Restaurant(
        restaurantId: '7',
        name: 'Burger House',
        address: '147 Birch Street, Downtown',
        phone: '+1 (555) 789-0123',
        rating: 4.2,
        cuisineType: 'American',
        imageUrl: 'https://picsum.photos/seed/burger-house/400/300',
      ),
      Restaurant(
        restaurantId: '8',
        name: 'Mediterranean Delight',
        address: '258 Willow Way, Riverside',
        phone: '+1 (555) 890-1234',
        rating: 4.6,
        cuisineType: 'Mediterranean',
        imageUrl: 'https://picsum.photos/seed/mediterranean/400/300',
      ),
    ];

    return ApiResponse.success(restaurants);
  }
}

