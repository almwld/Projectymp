import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final IconData icon;
  final Color color;
  final int itemsCount;

  CategoryModel({required this.id, required this.title, required this.icon, required this.color, required this.itemsCount});
}
