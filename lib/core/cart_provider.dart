import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final int price;

  CartItem({required this.id, required this.name, required this.price});
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get totalAmount {
    var total = 0;
    _items.forEach((key, item) => total += item.price);
    return total;
  }

  void addItem(String id, String name, int price) {
    _items.putIfAbsent(id, () => CartItem(id: id, name: name, price: price));
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
