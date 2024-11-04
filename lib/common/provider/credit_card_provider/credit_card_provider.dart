import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../credit_card_model/credit_card_model.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> _cards = [];
  String _inputCardNumber = '';

  List<CardModel> get cards => _cards;
  String get inputCardNumber => _inputCardNumber;

  CardProvider() {
    loadCards();
  }

  void updateCardNumber(String cardNumber) {
    _inputCardNumber = cardNumber;
    notifyListeners();
  }

  bool get isValidCard => _inputCardNumber.length == 16;

  Future<void> addCard(CardModel card) async {
    _cards.add(card);
    notifyListeners();
    await saveCards();
  }

  Future<void> removeCard(int index) async {
    _cards.removeAt(index);
    notifyListeners();
    await saveCards();
  }

  Future<void> saveCards() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      _cards.map((card) => card.toJson()).toList(),
    );
    await prefs.setString('saved_cards', encodedData);
  }


  Future<void> loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('saved_cards');
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      _cards = decodedData.map((json) => CardModel.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
