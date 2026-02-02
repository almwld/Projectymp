import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  final String image;

  CartItem({required this.id, required this.title, required this.price, this.quantity = 1, required this.image});

  Map<String, dynamic> toMap() => {
    'id': id, 'title': title, 'price': price, 'quantity': quantity, 'image': image,
  };

  factory CartItem.fromMap(Map<String, dynamic> map) => CartItem(
    id: map['id'], title: map['title'], price: map['price'], quantity: map['quantity'], image: map['image'],
  );
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  CartProvider() {
    loadCartFromDisk(); // استعادة السلة عند تشغيل التطبيق
  }

  // حفظ السلة في ذاكرة الهاتف
  Future<void> saveCartToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final data = json.encode(_items.map((key, item) => MapEntry(key, item.toMap())));
    await prefs.setString('user_cart', data);
  }

  // تحميل السلة من ذاكرة الهاتف
  Future<void> loadCartFromDisk() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('user_cart')) return;
    final data = json.decode(prefs.getString('user_cart')!) as Map<String, dynamic>;
    _items = data.map((key, value) => MapEntry(key, CartItem.fromMap(value)));
    notifyListeners();
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
    saveCartToDisk();
    notifyListeners();
  }
}
