import 'package:flutter/foundation.dart';
import 'package:foody/data/model/payment/payment.dart';

class CheckoutViewModel extends ChangeNotifier {
  String _deliveryAddress = '';
  PaymentMethod _paymentMethod = PaymentMethod.card;
  int _estimatedDeliveryTime = 30; // minutes

  String get deliveryAddress => _deliveryAddress;
  PaymentMethod get paymentMethod => _paymentMethod;
  int get estimatedDeliveryTime => _estimatedDeliveryTime;

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

  bool get canPlaceOrder => _deliveryAddress.trim().isNotEmpty;
}

