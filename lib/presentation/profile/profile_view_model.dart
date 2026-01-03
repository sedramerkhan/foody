import 'package:flutter/foundation.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/repo/restaurant_repo.dart';
import 'package:foody/data/repo/menu_repo.dart';
import 'package:foody/data/repo/driver_repo.dart';
import 'package:foody/data/repo/payment_repo.dart';

/// View model for profile screen
class ProfileViewModel extends BaseViewModel {
  final RestaurantRepo _restaurantRepo = RestaurantRepo();
  final MenuRepo _menuRepo = MenuRepo();
  final DriverRepo _driverRepo = getIt<DriverRepo>();
  final PaymentRepo _paymentRepo = getIt<PaymentRepo>();

  final ValueNotifier<ApiResponse<void>> addRestaurantsResponse =
      ValueNotifier(const ApiResponse.none());
  final ValueNotifier<ApiResponse<void>> addDriversResponse =
      ValueNotifier(const ApiResponse.none());
  final ValueNotifier<ApiResponse<void>> addPaymentsResponse =
      ValueNotifier(const ApiResponse.none());

  /// Add sample Syrian restaurants and their menus to Firebase
  Future<void> addSyrianRestaurants() async {
    notifyListeners();
    addRestaurantsResponse.value = const ApiResponse.loading();

    // Add restaurants
    final syrianRestaurants = RestaurantRepo.getSyrianRestaurants();
    final restaurantsResponse = await _restaurantRepo.addRestaurants(syrianRestaurants);

    if (restaurantsResponse.isFailure) {
      addRestaurantsResponse.value = restaurantsResponse;
      return;
    }

    // Add menu items for each restaurant
    for (final restaurant in syrianRestaurants) {
      final menuItems = MenuRepo.getSyrianMenuItems(restaurant.restaurantId);
      if (menuItems.isNotEmpty) {
        await _menuRepo.addMenuItems(menuItems);
      }
    }

    addRestaurantsResponse.value = const ApiResponse.success(null);
  }

  /// Add fake drivers to Firebase
  Future<void> addFakeDrivers() async {
    notifyListeners();
    addDriversResponse.value = const ApiResponse.loading();

    final fakeDrivers = DriverRepo.getFakeDrivers();
    final response = await _driverRepo.addDrivers(fakeDrivers);

    addDriversResponse.value = response;
  }



  @override
  void dispose() {
    addRestaurantsResponse.dispose();
    addDriversResponse.dispose();
    addPaymentsResponse.dispose();
    super.dispose();
  }
}

