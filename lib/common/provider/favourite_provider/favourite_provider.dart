import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/provider_model.dart';

class FavoritesProvider with ChangeNotifier {
  List<Product> _favoriteItems = [];

  List<Product> get favoriteItems => _favoriteItems;

  FavoritesProvider() {
    loadFavorites();
  }

  void addToFavorites(Product product) {
    if (!_favoriteItems.contains(product)) {
      _favoriteItems.add(product);
      saveFavorites();
      notifyListeners();
    }
  }

  void removeFromFavorites(Product product) {
    _favoriteItems.remove(product);
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteItems.contains(product);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = _favoriteItems.map((item) => item.toMap()).cast<String>().toList();
    await prefs.setStringList('favorites', favoritesList.map((item) => jsonEncode(item)).toList());
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoritesList = prefs.getStringList('favorites');
    if (favoritesList != null) {
      _favoriteItems = favoritesList.map((item) => Product.fromMap(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
