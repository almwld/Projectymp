import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  final String image;

  CartItem({required this.id, required this.title, required this.price, this.quantity = 1, required this.image});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price, String image) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existing) => CartItem(
        id: existing.id, title: existing.title, price: existing.price, image: existing.image,
        quantity: existing.quantity + 1,
      ));
    } else {
      _items.putIfAbsent(productId, () => CartItem(id: productId, title: title, price: price, image: image));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
