import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProduct(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
