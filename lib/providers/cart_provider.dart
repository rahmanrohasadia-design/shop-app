import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  CartProvider() {
    _loadCart();
  }

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    _saveCart(); 
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    _saveCart(); 
    notifyListeners();
  }


  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedCart = jsonEncode(cart);
    await prefs.setString('cart_data', encodedCart);
  }


  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedCart = prefs.getString('cart_data');

    if (encodedCart != null) {
      final decodedCart = jsonDecode(encodedCart) as List;
      cart.clear();
      for (var item in decodedCart) {
        cart.add(Map<String, dynamic>.from(item));
      }
      notifyListeners();
    }
  }
}
