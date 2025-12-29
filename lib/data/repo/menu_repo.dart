import 'dart:async';
import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/model/menu/menu.dart';

/// Repository for menu operations
class MenuRepo extends BaseRepository {
  /// Get menu items for a restaurant (mock data)
  Future<ApiResponse<List<Menu>>> getMenuItems(String restaurantId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    // Mock menu data based on restaurant ID
    final menuItems = _getMenuItemsForRestaurant(restaurantId);

    return ApiResponse.success(menuItems);
  }

  List<Menu> _getMenuItemsForRestaurant(String restaurantId) {
    switch (restaurantId) {
      case '1': // Bella Italia
        return [
          Menu(
            menuId: 'm1',
            restaurantId: '1',
            itemName: 'Margherita Pizza',
            description: 'Fresh mozzarella, tomato sauce, and basil',
            price: 14.99,
            imageUrl: 'https://picsum.photos/seed/margherita/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm2',
            restaurantId: '1',
            itemName: 'Spaghetti Carbonara',
            description: 'Creamy pasta with bacon and parmesan',
            price: 16.99,
            imageUrl: 'https://picsum.photos/seed/carbonara/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm3',
            restaurantId: '1',
            itemName: 'Chicken Parmesan',
            description: 'Breaded chicken with marinara and mozzarella',
            price: 18.99,
            imageUrl: 'https://picsum.photos/seed/chicken-parm/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm4',
            restaurantId: '1',
            itemName: 'Caesar Salad',
            description: 'Romaine lettuce, croutons, parmesan, caesar dressing',
            price: 10.99,
            imageUrl: 'https://picsum.photos/seed/caesar/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm5',
            restaurantId: '1',
            itemName: 'Tiramisu',
            description: 'Classic Italian dessert with coffee and mascarpone',
            price: 8.99,
            imageUrl: 'https://picsum.photos/seed/tiramisu/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm6',
            restaurantId: '1',
            itemName: 'Lasagna',
            description: 'Layered pasta with meat sauce and cheese',
            price: 17.99,
            imageUrl: 'https://picsum.photos/seed/lasagna/300/200',
            availabilityStatus: false,
          ),
        ];

      case '2': // Dragon Palace
        return [
          Menu(
            menuId: 'm7',
            restaurantId: '2',
            itemName: 'Sweet and Sour Chicken',
            description: 'Crispy chicken with sweet and sour sauce',
            price: 13.99,
            imageUrl: 'https://picsum.photos/seed/sweet-sour/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm8',
            restaurantId: '2',
            itemName: 'Kung Pao Shrimp',
            description: 'Spicy shrimp with peanuts and vegetables',
            price: 16.99,
            imageUrl: 'https://picsum.photos/seed/kung-pao/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm9',
            restaurantId: '2',
            itemName: 'Beef Lo Mein',
            description: 'Stir-fried noodles with beef and vegetables',
            price: 14.99,
            imageUrl: 'https://picsum.photos/seed/lo-mein/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm10',
            restaurantId: '2',
            itemName: 'Spring Rolls',
            description: 'Crispy vegetable spring rolls with dipping sauce',
            price: 6.99,
            imageUrl: 'https://picsum.photos/seed/spring-rolls/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm11',
            restaurantId: '2',
            itemName: 'General Tso\'s Chicken',
            description: 'Crispy chicken in sweet and spicy sauce',
            price: 15.99,
            imageUrl: 'https://picsum.photos/seed/general-tsos/300/200',
            availabilityStatus: true,
          ),
        ];

      case '3': // Taco Fiesta
        return [
          Menu(
            menuId: 'm12',
            restaurantId: '3',
            itemName: 'Beef Tacos',
            description: 'Three soft tacos with seasoned beef, lettuce, and cheese',
            price: 11.99,
            imageUrl: 'https://picsum.photos/seed/beef-tacos/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm13',
            restaurantId: '3',
            itemName: 'Chicken Quesadilla',
            description: 'Grilled chicken with cheese in a flour tortilla',
            price: 12.99,
            imageUrl: 'https://picsum.photos/seed/quesadilla/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm14',
            restaurantId: '3',
            itemName: 'Burrito Bowl',
            description: 'Rice, beans, chicken, salsa, and guacamole',
            price: 13.99,
            imageUrl: 'https://picsum.photos/seed/burrito-bowl/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm15',
            restaurantId: '3',
            itemName: 'Nachos Supreme',
            description: 'Tortilla chips with cheese, jalapeños, and sour cream',
            price: 10.99,
            imageUrl: 'https://picsum.photos/seed/nachos/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm16',
            restaurantId: '3',
            itemName: 'Churros',
            description: 'Fried dough pastries with cinnamon sugar',
            price: 5.99,
            imageUrl: 'https://picsum.photos/seed/churros/300/200',
            availabilityStatus: true,
          ),
        ];

      default:
        // Generic menu for other restaurants
        return [
          Menu(
            menuId: 'm17',
            restaurantId: restaurantId,
            itemName: 'Signature Dish',
            description: 'Our chef\'s special creation',
            price: 15.99,
            imageUrl: 'https://picsum.photos/seed/signature/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm18',
            restaurantId: restaurantId,
            itemName: 'House Special',
            description: 'A customer favorite',
            price: 16.99,
            imageUrl: 'https://picsum.photos/seed/house-special/300/200',
            availabilityStatus: true,
          ),
          Menu(
            menuId: 'm19',
            restaurantId: restaurantId,
            itemName: 'Chef\'s Choice',
            description: 'Today\'s recommended dish',
            price: 17.99,
            imageUrl: 'https://picsum.photos/seed/chefs-choice/300/200',
            availabilityStatus: true,
          ),
        ];
    }
  }
}

