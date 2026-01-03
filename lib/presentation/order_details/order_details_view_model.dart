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

  OrderDetails({
    required this.order,
    required this.items,
    this.restaurant,
    this.payment,
    this.delivery,
    this.driver,
  });
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

      final orderDetails = OrderDetails(
        order: order,
        items: itemsWithMenu,
        restaurant: restaurant,
        payment: payment,
        delivery: delivery,
        driver: driver,
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

    // Step 0: Order Placed (pending)
    if (order.orderStatus == OrderStatus.pending) {
      return 0;
    }

    // Step 1: Order Confirmed (confirmed)
    if (order.orderStatus == OrderStatus.confirmed) {
      return 1;
    }

    // Step 2: Preparing (delivery assigned)
    if (delivery != null && delivery.deliveryStatus == DeliveryStatus.assigned) {
      return 2;
    }

    // Step 3: On The Way (delivery on_the_way)
    if (delivery != null && delivery.deliveryStatus == DeliveryStatus.onTheWay) {
      return 3;
    }

    // Step 4: Delivered (delivered)
    if (order.orderStatus == OrderStatus.delivered) {
      return 4;
    }

    // Canceled orders show step 0
    if (order.orderStatus == OrderStatus.canceled) {
      return 0;
    }

    return 0;
  }

  @override
  void dispose() {
    orderDetailsResponse.dispose();
    super.dispose();
  }
}

