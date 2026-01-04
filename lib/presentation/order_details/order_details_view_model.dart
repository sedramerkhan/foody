import 'package:flutter/foundation.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/order/order.dart';
import 'package:foody/data/model/order_item/order_item.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/data/model/menu/menu.dart';
import 'package:foody/data/model/payment/payment.dart';
import 'package:foody/data/model/delivery/delivery.dart';
import 'package:foody/data/model/driver/driver.dart';
import 'package:foody/data/repo/order_repo.dart';
import 'package:foody/data/repo/order_item_repo.dart';
import 'package:foody/data/repo/restaurant_repo.dart';
import 'package:foody/data/repo/menu_repo.dart';
import 'package:foody/data/repo/payment_repo.dart';
import 'package:foody/data/repo/delivery_repo.dart';
import 'package:foody/data/repo/driver_repo.dart';
import 'package:foody/data/repo/review_repo.dart';
import 'package:foody/data/model/review/review.dart';

/// Extended order item with menu details
class OrderItemWithMenu {
  final OrderItem orderItem;
  final Menu? menu;

  OrderItemWithMenu({
    required this.orderItem,
    this.menu,
  });
}

/// Complete order details
class OrderDetails {
  final Order order;
  final List<OrderItemWithMenu> items;
  final Restaurant? restaurant;
  final Payment? payment;
  final Delivery? delivery;
  final Driver? driver;
  final Review? review;

  OrderDetails({
    required this.order,
    required this.items,
    this.restaurant,
    this.payment,
    this.delivery,
    this.driver,
    this.review,
  });

  /// Check if order can be reviewed (completed and not already reviewed)
  bool get canReview => order.orderStatus == OrderStatus.delivered && review == null;
}

/// View model for order details screen
class OrderDetailsViewModel extends BaseViewModel {
  final OrderRepo _orderRepo = getIt<OrderRepo>();
  final OrderItemRepo _orderItemRepo = getIt<OrderItemRepo>();
  final RestaurantRepo _restaurantRepo = getIt<RestaurantRepo>();
  final MenuRepo _menuRepo = getIt<MenuRepo>();
  final PaymentRepo _paymentRepo = getIt<PaymentRepo>();
  final DeliveryRepo _deliveryRepo = getIt<DeliveryRepo>();
  final DriverRepo _driverRepo = getIt<DriverRepo>();
  final ReviewRepo _reviewRepo = getIt<ReviewRepo>();

  final ValueNotifier<ApiResponse<OrderDetails>> orderDetailsResponse =
      ValueNotifier(const ApiResponse.none());

  /// Load order details
  Future<void> loadOrderDetails(String orderId) async {
    notifyListeners();
    orderDetailsResponse.value = const ApiResponse.loading();

    try {
      // Fetch order
      final orderResponse = await _orderRepo.getOrder(orderId);
      if (orderResponse.isFailure) {
        orderDetailsResponse.value = orderResponse.mapData((_) => throw Exception('Order not found'));
        return;
      }

      final order = orderResponse.getDataOrNull();
      if (order == null) {
        orderDetailsResponse.value = ApiResponse.failure(message: 'Order not found');
        return;
      }

      // Fetch order items
      final itemsResponse = await _orderItemRepo.getOrderItems(orderId);
      final orderItems = itemsResponse.isSuccess ? (itemsResponse.getDataOrNull() ?? []) : [];

      // Fetch all menu items for the restaurant once
      final menuResponse = await _menuRepo.getMenuItems(order.restaurantId);
      final menus = menuResponse.isSuccess ? (menuResponse.getDataOrNull() ?? []) : [];

      // Match order items with menu items
      final itemsWithMenu = <OrderItemWithMenu>[];
      for (final orderItem in orderItems) {
        Menu? menu;
        try {
          menu = menus.firstWhere((m) => m.menuId == orderItem.menuId);
        } catch (e) {
          // Menu item not found, continue without it
        }
        itemsWithMenu.add(OrderItemWithMenu(orderItem: orderItem, menu: menu));
      }

      // Fetch restaurant
      Restaurant? restaurant;
      final restaurantsResponse = await _restaurantRepo.getRestaurants();
      if (restaurantsResponse.isSuccess) {
        final restaurants = restaurantsResponse.getDataOrNull() ?? [];
        try {
          restaurant = restaurants.firstWhere((r) => r.restaurantId == order.restaurantId);
        } catch (e) {
          // Restaurant not found
        }
      }

      // Fetch payment
      final paymentResponse = await _paymentRepo.getPaymentByOrderId(orderId);
      final payment = paymentResponse.isSuccess ? paymentResponse.getDataOrNull() : null;

      // Fetch delivery
      final deliveryResponse = await _deliveryRepo.getDeliveryByOrderId(orderId);
      final delivery = deliveryResponse.isSuccess ? deliveryResponse.getDataOrNull() : null;

      // Fetch driver if delivery exists
      Driver? driver;
      if (delivery != null && delivery.driverId != null) {
        final driverResponse = await _driverRepo.getDriver(delivery.driverId!);
        driver = driverResponse.isSuccess ? driverResponse.getDataOrNull() : null;
      }

      // Fetch review if order is delivered
      Review? review;
      if (order.orderStatus == OrderStatus.delivered) {
        final reviewResponse = await _reviewRepo.getReviewByOrderId(orderId);
        review = reviewResponse.isSuccess ? reviewResponse.getDataOrNull() : null;
      }

      final orderDetails = OrderDetails(
        order: order,
        items: itemsWithMenu,
        restaurant: restaurant,
        payment: payment,
        delivery: delivery,
        driver: driver,
        review: review,
      );

      orderDetailsResponse.value = ApiResponse.success(orderDetails);
    } catch (e) {
      orderDetailsResponse.value = ApiResponse.failure(
        message: 'Failed to load order details: ${e.toString()}',
      );
    }
  }

  /// Get active step for stepper based on order and delivery status
  int getActiveStep(OrderDetails orderDetails) {
    final order = orderDetails.order;
    final delivery = orderDetails.delivery;

    // Get effective order status (mapping delivery status to order status for display)
    final effectiveStatus = _getEffectiveOrderStatus(order.orderStatus, delivery?.deliveryStatus);

    // Map status to step index
    switch (effectiveStatus) {
      case OrderStatus.pending:
        return 0;
      case OrderStatus.confirmed:
        return 1;
      case OrderStatus.preparing:
        return 2;
      case OrderStatus.onTheWay:
        return 3;
      case OrderStatus.delivered:
        return 4;
      case OrderStatus.canceled:
        return 0; // Canceled orders show step 0
    }
  }

  /// Get effective order status by mapping delivery status to order status
  OrderStatus _getEffectiveOrderStatus(OrderStatus orderStatus, DeliveryStatus? deliveryStatus) {
    // If order is confirmed and has delivery, map delivery status to order status
    if (orderStatus == OrderStatus.confirmed && deliveryStatus != null) {
      switch (deliveryStatus) {
        case DeliveryStatus.assigned:
          return OrderStatus.preparing;
        case DeliveryStatus.onTheWay:
          return OrderStatus.onTheWay;
        case DeliveryStatus.delivered:
          return OrderStatus.delivered;
      }
    }
    
    // Otherwise return the order status as is
    return orderStatus;
  }

  @override
  void dispose() {
    orderDetailsResponse.dispose();
    super.dispose();
  }
}

