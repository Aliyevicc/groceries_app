import 'package:flutter/foundation.dart';
import 'model/model.dart';


class CartProvider with ChangeNotifier {
  final Map<Product, int> _cartItems = {};

  Map<Product, int> get cartItems => _cartItems;


  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }


  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product) && _cartItems[product]! > 1) {
      _cartItems[product] = _cartItems[product]! - 1;
    } else {
      _cartItems.remove(product);
    }
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
}
