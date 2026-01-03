import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/order_item/order_item.dart';

/// Repository for order item operations
class OrderItemRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Create an order item in Firebase
  Future<ApiResponse<String>> createOrderItem(OrderItem item) async {
    final itemData = item.toJson();
    final path = 'order_items/${item.orderItemId}';
    
    final response = await _databaseService.write(path, itemData);
    
    if (response.isFailure) {
      return response.mapData((_) => '');
    }
    
    return ApiResponse.success(item.orderItemId);
  }

  /// Get all order items for a specific order
  Future<ApiResponse<List<OrderItem>>> getOrderItems(String orderId) async {
    try {
      // Read all order items and filter by order_id
      final response = await _databaseService.readList('order_items');
      
      if (response.isFailure) {
        return response.mapData((_) => <OrderItem>[]);
      }

      final itemsList = response.getDataOrNull() ?? [];
      
      try {
        final items = itemsList
            .where((json) => json is Map<String, dynamic> && json['order_id'] == orderId)
            .map((json) => OrderItem.fromJson(json as Map<String, dynamic>))
            .toList();
        
        return ApiResponse.success(items);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse order items: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch order items: ${e.toString()}',
      );
    }
  }

  /// Create multiple order items
  Future<ApiResponse<void>> createOrderItems(List<OrderItem> items) async {
    try {
      for (final item in items) {
        final response = await createOrderItem(item);
        if (response.isFailure) {
          final failure = response as Failure;
          return ApiResponse.failure(
            message: 'Failed to add order item ${item.orderItemId}: ${failure.message}',
          );
        }
      }
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to add order items: ${e.toString()}',
      );
    }
  }
}

