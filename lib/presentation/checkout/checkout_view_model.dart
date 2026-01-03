import 'package:flutter/foundation.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/data/model/payment/payment.dart';
import 'package:foody/data/model/order/order.dart';
import 'package:foody/data/model/order_item/order_item.dart';
import 'package:foody/data/model/delivery/delivery.dart';
import 'package:foody/data/model/cart/cart_data.dart';
import 'package:foody/core/di/di.dart';

class CheckoutViewModel extends ChangeNotifier {
  final OrderRepo _orderRepo = getIt<OrderRepo>();
  final OrderItemRepo _orderItemRepo = getIt<OrderItemRepo>();
  final PaymentRepo _paymentRepo = getIt<PaymentRepo>();
  final DeliveryRepo _deliveryRepo = getIt<DeliveryRepo>();
  final DriverRepo _driverRepo = getIt<DriverRepo>();
  final CartRepo _cartRepo = getIt<CartRepo>();
  final AppLocalData _appLocalData = AppLocalData();

  String _deliveryAddress = '';
  PaymentMethod _paymentMethod = PaymentMethod.card;
  int _estimatedDeliveryTime = 30; // minutes
  bool _isPlacingOrder = false;

  String get deliveryAddress => _deliveryAddress;
  PaymentMethod get paymentMethod => _paymentMethod;
  int get estimatedDeliveryTime => _estimatedDeliveryTime;
  bool get isPlacingOrder => _isPlacingOrder;

  void setDeliveryAddress(String address) {
    _deliveryAddress = address;
    notifyListeners();
  }

  void setPaymentMethod(PaymentMethod method) {
    _paymentMethod = method;
    notifyListeners();
  }

  void setEstimatedDeliveryTime(int minutes) {
    _estimatedDeliveryTime = minutes;
    notifyListeners();
  }

  bool get canPlaceOrder => _deliveryAddress.trim().isNotEmpty && !_isPlacingOrder;

  /// Place order with all related data
  Future<ApiResponse<Order>> placeOrder() async {
    if (!canPlaceOrder) {
      return const ApiResponse.failure(
        message: 'Please provide a delivery address.',
      );
    }

    _isPlacingOrder = true;
    notifyListeners();

    try {
      // Get cart data
      final cartResponse = await _cartRepo.getCart();
      if (cartResponse.isFailure) {
        _isPlacingOrder = false;
        notifyListeners();
        return cartResponse.mapData((_) => throw Exception('Cart not found'));
      }

      final cartData = cartResponse.getDataOrNull();
      if (cartData == null || cartData.isEmpty || cartData.restaurant == null) {
        _isPlacingOrder = false;
        notifyListeners();
        return const ApiResponse.failure(
          message: 'Cart is empty. Please add items to cart.',
        );
      }

      // Get current user ID
      final user = await _appLocalData.user.getData();
      if (user == null) {
        _isPlacingOrder = false;
        notifyListeners();
        return const ApiResponse.failure(
          message: 'User not authenticated. Please sign in again.',
        );
      }

      final userId = user.uid;
      final restaurant = cartData.restaurant!;
      final cartItems = cartData.items;
      final subtotal = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
      const deliveryFee = 2.50;
      final totalAmount = subtotal + deliveryFee;

      // Generate order ID
      final orderId = DateTime.now().millisecondsSinceEpoch.toString();

      // 1. Create Order
      final order = Order(
        orderId: orderId,
        userId: userId,
        restaurantId: restaurant.restaurantId,
        orderStatus: OrderStatus.pending,
        totalAmount: totalAmount,
        createdAt: DateTime.now(),
      );

      final orderResponse = await _orderRepo.createOrder(order);
      if (orderResponse.isFailure) {
        _isPlacingOrder = false;
        notifyListeners();
        return orderResponse.mapData((_) => order);
      }

      // 2. Create Order Items
      final orderItems = cartItems.map((cartItem) {
        final orderItemId = '${orderId}_${cartItem.menuItem.menuId}';
        return OrderItem(
          orderItemId: orderItemId,
          orderId: orderId,
          menuId: cartItem.menuItem.menuId,
          quantity: cartItem.quantity,
          price: cartItem.menuItem.price,
        );
      }).toList();

      final orderItemsResponse = await _orderItemRepo.createOrderItems(orderItems);
      if (orderItemsResponse.isFailure) {
        _isPlacingOrder = false;
        notifyListeners();
        final failure = orderItemsResponse as Failure;
        return ApiResponse.failure(
          message: 'Failed to create order items: ${failure.message}',
        );
      }

      // 3. Get available driver
      final driversResponse = await _driverRepo.getAvailableDrivers();
      String? driverId;
      if (driversResponse.isSuccess) {
        final drivers = driversResponse.getDataOrNull() ?? [];
        if (drivers.isNotEmpty) {
          driverId = drivers.first.driverId;
        }
      }

      // 4. Create Delivery
      final deliveryId = 'delivery_$orderId';
      final delivery = Delivery(
        deliveryId: deliveryId,
        orderId: orderId,
        driverId: driverId,
        deliveryStatus: DeliveryStatus.assigned,
        estimatedTime: _estimatedDeliveryTime,
        actualTime: null,
      );

      final deliveryResponse = await _deliveryRepo.createDelivery(delivery);
      if (deliveryResponse.isFailure) {
        _isPlacingOrder = false;
        notifyListeners();
        final failure = deliveryResponse as Failure;
        return ApiResponse.failure(
          message: 'Failed to create delivery: ${failure.message}',
        );
      }

      // 5. Create Payment
      final paymentId = 'payment_$orderId';
      final now = DateTime.now();
      final paymentStatus = _paymentMethod == PaymentMethod.cash
          ? PaymentStatus.pending
          : PaymentStatus.completed;
      final paidAt = paymentStatus == PaymentStatus.completed ? now : null;
      final transactionId = paymentStatus == PaymentStatus.completed
          ? 'TXN-$orderId-${now.millisecondsSinceEpoch}'
          : null;

      final payment = Payment(
        paymentId: paymentId,
        orderId: orderId,
        paymentMethod: _paymentMethod,
        paymentStatus: paymentStatus,
        transactionId: transactionId,
        amount: totalAmount,
        paidAt: paidAt,
      );

      final paymentResponse = await _paymentRepo.createPayment(payment);
      if (paymentResponse.isFailure) {
        _isPlacingOrder = false;
        notifyListeners();
        final failure = paymentResponse as Failure;
        return ApiResponse.failure(
          message: 'Failed to create payment: ${failure.message}',
        );
      }

      // 6. Clear cart
      await _cartRepo.clearCart();

      _isPlacingOrder = false;
      notifyListeners();

      return ApiResponse.success(order);
    } catch (e) {
      _isPlacingOrder = false;
      notifyListeners();
      return ApiResponse.failure(
        message: 'Failed to place order: ${e.toString()}',
      );
    }
  }
}

