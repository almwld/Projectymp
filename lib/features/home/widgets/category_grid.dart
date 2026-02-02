import 'package:flutter/material.dart';
import '../../../core/models/category_model.dart';

class CategoryGrid extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(id: '1', title: 'عسل سدر', icon: Icons.honey_guest_out_outlined, color: Colors.amber, itemsCount: 12),
    CategoryModel(id: '2', title: 'بن يمني', icon: Icons.coffee, color: Colors.brown, itemsCount: 8),
    CategoryModel(id: '3', title: 'بهارات', icon: Icons.Kitchen, color: Colors.redAccent, itemsCount: 25),
    CategoryModel(id: '4', title: 'هدايا وتراث', icon: Icons.card_giftcard, color: Colors.teal, itemsCount: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Container(
          decoration: BoxDecoration(
            color: cat.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: cat.color.withOpacity(0.3)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(cat.icon, size: 40, color: cat.color),
              const SizedBox(height: 10),
              Text(cat.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("${cat.itemsCount} صنف", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
        );
      },
    );
  }
}
