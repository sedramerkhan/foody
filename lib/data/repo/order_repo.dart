import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/order/order.dart';

/// Repository for order operations
class OrderRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Create an order in Firebase
  Future<ApiResponse<String>> createOrder(Order order) async {
    final orderData = order.toJson();
    final path = 'orders/${order.orderId}';
    
    final response = await _databaseService.write(path, orderData);
    
    if (response.isFailure) {
      return response.mapData((_) => '');
    }
    
    return ApiResponse.success(order.orderId);
  }

  /// Get all orders for a specific user
  Future<ApiResponse<List<Order>>> getUserOrders(String userId) async {
    try {
      // Read all orders and filter by user_id
      final response = await _databaseService.readList('orders');
      
      if (response.isFailure) {
        return response.mapData((_) => <Order>[]);
      }

      final ordersList = response.getDataOrNull() ?? [];
      
      try {
        final orders = ordersList
            .map((json) => Order.fromJson(json))
            .toList();
        
        // Sort by created_at descending (newest first)
        orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        
        return ApiResponse.success(orders);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse orders: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch orders: ${e.toString()}',
      );
    }
  }

  /// Get a single order by ID
  Future<ApiResponse<Order>> getOrder(String orderId) async {
    final response = await _databaseService.read('orders/$orderId');
    
    if (response.isFailure) {
      return response.mapData((_) => throw Exception('Order not found'));
    }

    final orderData = response.getDataOrNull();
    if (orderData == null) {
      return ApiResponse.failure(message: 'Order not found');
    }

    try {
      final order = Order.fromJson(orderData);
      return ApiResponse.success(order);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to parse order: ${e.toString()}',
      );
    }
  }

  /// Update order status
  Future<ApiResponse<void>> updateOrderStatus(String orderId, OrderStatus status) async {
    final path = 'orders/$orderId';
    final updateData = {
      'order_status': status.name,
    };
    
    final response = await _databaseService.update(path, updateData);
    
    if (response.isFailure) {
      return response;
    }
    
    return const ApiResponse.success(null);
  }
}

