import 'package:flutter/foundation.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/data/model/menu/menu.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/data/repo/cart_repo.dart';

class CartViewModel extends BaseViewModel {
  final CartRepo _cartRepo = CartRepo();
  final List<CartItem> _items = [];
  Restaurant? _restaurant;
  bool _isInitialized = false;

  List<CartItem> get items => List.unmodifiable(_items);
  Restaurant? get restaurant => _restaurant;
  
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalAmount => _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  /// Initialize cart from local storage
  Future<void> init() async {
    if (_isInitialized) return;
    
    try {
      final response = await _cartRepo.getCart();
      if (response.isSuccess) {
        final cartData = response.getDataOrNull() ?? CartData.empty();
        _items.clear();
        _items.addAll(cartData.items);
        _restaurant = cartData.restaurant;
      }
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      _isInitialized = true;
    }
  }

  /// Save cart to local storage
  Future<void> _saveCart() async {
    try {
      final cartData = CartData(
        items: List.from(_items),
        restaurant: _restaurant,
      );
      await _cartRepo.saveCart(cartData);
    } catch (e) {
      // Silently fail - cart saving shouldn't block UI
    }
  }

  /// Add item to cart
  void addItem(Menu menuItem, Restaurant restaurant) {
    // If cart has items from different restaurant, clear cart first
    if (_restaurant != null && _restaurant!.restaurantId != restaurant.restaurantId) {
      clearCart();
    }
    
    _restaurant = restaurant;
    
    final existingIndex = _items.indexWhere(
      (item) => item.menuItem.menuId == menuItem.menuId,
    );

    if (existingIndex >= 0) {
      // Increase quantity
      _items[existingIndex] = CartItem(
        menuItem: _items[existingIndex].menuItem,
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      // Add new item
      _items.add(CartItem(menuItem: menuItem, quantity: 1));
    }
    
    notifyListeners();
    _saveCart();
  }

  /// Remove item from cart
  void removeItem(String menuId) {
    _items.removeWhere((item) => item.menuItem.menuId == menuId);
    if (_items.isEmpty) {
      _restaurant = null;
    }
    notifyListeners();
    _saveCart();
  }

  /// Update item quantity
  void updateQuantity(String menuId, int quantity) {
    if (quantity <= 0) {
      removeItem(menuId);
      return;
    }

    final index = _items.indexWhere(
      (item) => item.menuItem.menuId == menuId,
    );

    if (index >= 0) {
      _items[index] = CartItem(
        menuItem: _items[index].menuItem,
        quantity: quantity,
      );
      notifyListeners();
      _saveCart();
    }
  }

  /// Clear cart
  void clearCart() {
    _items.clear();
    _restaurant = null;
    notifyListeners();
    _cartRepo.clearCart();
  }

  /// Get quantity for a specific menu item
  int getQuantity(String menuId) {
    try {
      final item = _items.firstWhere(
        (item) => item.menuItem.menuId == menuId,
      );
      return item.quantity;
    } catch (e) {
      return 0;
    }
  }
}

