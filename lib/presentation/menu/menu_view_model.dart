import 'package:flutter/foundation.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/model/menu/menu.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/data/repo/menu_repo.dart';

/// View model for menu screen
class MenuViewModel extends BaseViewModel {
  final MenuRepo _menuRepo = MenuRepo();

  final ValueNotifier<ApiResponse<List<Menu>>> menuItemsResponse =
      ValueNotifier(const ApiResponse.none());

  Restaurant? selectedRestaurant;

  /// Set selected restaurant
  void setRestaurant(Restaurant restaurant) {
    selectedRestaurant = restaurant;
  }

  /// Load menu items for the selected restaurant
  Future<ApiResponse<List<Menu>>> loadMenuItems() async {
    if (selectedRestaurant == null) {
      return const ApiResponse.failure(
        code: 'NO_RESTAURANT',
        message: 'No restaurant selected',
      );
    }

    notifyListeners();
    menuItemsResponse.value = const ApiResponse.loading();

    final response = await _menuRepo.getMenuItems(selectedRestaurant!.restaurantId);

    menuItemsResponse.value = response;
    return response;
  }

  @override
  void dispose() {
    menuItemsResponse.dispose();
    super.dispose();
  }
}

