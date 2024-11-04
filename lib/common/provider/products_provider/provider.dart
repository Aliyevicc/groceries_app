import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../products_model/provider_model.dart';

class CartProvider with ChangeNotifier {
  final Map<Product, int> _cartItems = {};

  CartProvider() {
    loadCart(); // Load the cart from SharedPreferences when the provider is created
  }

  Map<Product, int> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    saveCart(); // Save cart whenever an item is added
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product) && _cartItems[product]! > 1) {
      _cartItems[product] = _cartItems[product]! - 1;
    } else {
      _cartItems.remove(product);
    }
    saveCart(); // Save cart whenever an item is removed
    notifyListeners();
  }

  void removeItem(Product product) {
    _cartItems.remove(product);
    saveCart(); // Save cart whenever an item is removed
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.entries
        .map((entry) => entry.key.price * entry.value)
        .fold(0.0, (sum, element) => sum + element);
  }

  int get itemCount {
    return _cartItems.values.fold(0, (sum, element) => sum + element);
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartList = _cartItems.entries.map((entry) {
      return jsonEncode({
        'product': entry.key.toMap(),
        'quantity': entry.value,
      });
    }).toList();
    await prefs.setStringList('cartItems', cartList);
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartList = prefs.getStringList('cartItems');
    if (cartList != null) {
      _cartItems.clear();
      for (String item in cartList) {
        Map<String, dynamic> map = jsonDecode(item);
        Product product = Product.fromMap(map['product']);
        int quantity = map['quantity'];
        _cartItems[product] = quantity;
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    saveCart();
    notifyListeners();
  }
}
