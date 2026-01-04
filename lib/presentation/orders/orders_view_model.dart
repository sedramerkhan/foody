import 'package:flutter/foundation.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/order/order.dart';
import 'package:foody/data/model/delivery/delivery.dart';
import 'package:foody/data/repo/order_repo.dart';
import 'package:foody/data/repo/delivery_repo.dart';
import 'package:foody/data/local/app_local_data.dart';

/// Extended order with delivery info
class OrderWithDelivery {
  final Order order;
  final Delivery? delivery;

  OrderWithDelivery({
    required this.order,
    this.delivery,
  });
}

/// View model for orders screen
class OrdersViewModel extends BaseViewModel {
  final OrderRepo _orderRepo = getIt<OrderRepo>();
  final DeliveryRepo _deliveryRepo = getIt<DeliveryRepo>();
  final AppLocalData _appLocalData = AppLocalData();

  final ValueNotifier<ApiResponse<List<OrderWithDelivery>>> ordersResponse =
  ValueNotifier(const ApiResponse.none());

  /// Load orders for current user
  Future<void> loadOrders() async {
    ordersResponse.value = const ApiResponse.loading();

    try {
      // Get current user ID
      final user = await _appLocalData.user.getData();
      if (user == null) {
        ordersResponse.value = const ApiResponse.failure(
          message: 'User not authenticated. Please sign in again.',
        );
        return;
      }

      final userId = user.uid;

      // Fetch orders
      final result = await _orderRepo.getUserOrders(userId);
      if (result.isFailure) {
        ordersResponse.value = result.mapData((_) => <OrderWithDelivery>[]);
        return;
      }

      final orders = result.getDataOrNull() ?? [];

      // Fetch delivery info for each order
      final ordersWithDelivery = <OrderWithDelivery>[];
      for (final order in orders) {
        final deliveryResponse = await _deliveryRepo.getDeliveryByOrderId(order.orderId);
        final delivery = deliveryResponse.isSuccess
            ? deliveryResponse.getDataOrNull()
            : null;

        ordersWithDelivery.add(OrderWithDelivery(
          order: order,
          delivery: delivery,
        ));
      }

      this.ordersResponse.value = ApiResponse.success(ordersWithDelivery);
    } catch (e) {
      ordersResponse.value = ApiResponse.failure(
        message: 'Failed to load orders: ${e.toString()}',
      );
    }
  }

  /// Refresh orders (for pull-to-refresh)
  Future<void> refreshOrders() async {
    await loadOrders();
  }

  /// Get upcoming orders (pending, confirmed, or on_the_way)
  List<OrderWithDelivery> getUpcomingOrders() {
    final response = ordersResponse.value;
    if (response.isFailure || response.isLoading || response.isNone) {
      return [];
    }

    final orders = response.getDataOrNull() ?? [];
    return orders.where((orderWithDelivery) {
      final order = orderWithDelivery.order;
      final delivery = orderWithDelivery.delivery;

      // Upcoming: pending, confirmed, preparing, or on_the_way
      return order.orderStatus == OrderStatus.pending ||
          order.orderStatus == OrderStatus.confirmed ||
          order.orderStatus == OrderStatus.preparing ||
          order.orderStatus == OrderStatus.onTheWay ||
          (delivery != null && delivery.deliveryStatus == DeliveryStatus.onTheWay);
    }).toList();
  }

  /// Get history orders (delivered or canceled)
  List<OrderWithDelivery> getHistoryOrders() {
    final response = ordersResponse.value;
    if (response.isFailure || response.isLoading || response.isNone) {
      return [];
    }

    final orders = response.getDataOrNull() ?? [];
    return orders.where((orderWithDelivery) {
      final order = orderWithDelivery.order;
      return order.orderStatus == OrderStatus.delivered ||
          order.orderStatus == OrderStatus.canceled;
    }).toList();
  }

  @override
  void dispose() {
    ordersResponse.dispose();
    super.dispose();
  }
}

