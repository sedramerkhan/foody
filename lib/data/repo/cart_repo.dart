import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/local/app_local_data.dart';
import 'package:foody/data/model/cart/cart_data.dart';

/// Repository for cart operations
class CartRepo extends BaseRepository {
  final AppLocalData _appLocalData = AppLocalData();

  /// Get cart from local storage
  Future<ApiResponse<CartData>> getCart() async {
    try {
      final cartData = await _appLocalData.getCart();
      return ApiResponse.success(cartData);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to load cart: ${e.toString()}',
      );
    }
  }

  /// Save cart to local storage
  Future<ApiResponse<void>> saveCart(CartData cart) async {
    try {
      await _appLocalData.storeCart(cart);
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to save cart: ${e.toString()}',
      );
    }
  }

  /// Clear cart from local storage
  Future<ApiResponse<void>> clearCart() async {
    try {
      await _appLocalData.clearCart();
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to clear cart: ${e.toString()}',
      );
    }
  }
}

