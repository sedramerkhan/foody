import 'package:flutter/foundation.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/data/repo/restaurant_repo.dart';

/// View model for home screen
class HomeViewModel extends BaseViewModel {
  final RestaurantRepo _restaurantRepo = RestaurantRepo();

  final ValueNotifier<ApiResponse<List<Restaurant>>> restaurantsResponse =
      ValueNotifier(const ApiResponse.none());

  /// Load restaurants
  Future<ApiResponse<List<Restaurant>>> loadRestaurants() async {
    notifyListeners();
    restaurantsResponse.value = const ApiResponse.loading();

    final response = await _restaurantRepo.getRestaurants();

    restaurantsResponse.value = response;
    return response;
  }

  /// Refresh restaurants (for pull-to-refresh)
  /// This keeps the current data visible while refreshing
  Future<void> refreshRestaurants() async {
    final response = await _restaurantRepo.getRestaurants();
    restaurantsResponse.value = response;
  }

  @override
  void dispose() {
    restaurantsResponse.dispose();
    super.dispose();
  }
}

