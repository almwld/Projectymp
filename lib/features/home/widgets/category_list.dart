import 'package:flutter/material.dart';

class ExtendedCategoryBar extends StatelessWidget {
  const ExtendedCategoryBar({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'الكل', 'icon': Icons.grid_view, 'color': Colors.grey},
    {'name': 'عسل', 'icon': Icons.bakery_dining, 'color': Colors.orange},
    {'name': 'بن', 'icon': Icons.coffee, 'color': Colors.brown},
    {'name': 'إلكترونيات', 'icon': Icons.phone_android, 'color': Colors.blue},
    {'name': 'سيارات', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'عقارات', 'icon': Icons.home, 'color': Colors.green},
    {'name': 'زراعة', 'icon': Icons.agriculture, 'color': Colors.teal},
    {'name': 'ملابس', 'icon': Icons.checkroom, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: categories[index]['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: categories[index]['color'].withOpacity(0.5)),
                  ),
                  child: Icon(categories[index]['icon'], color: categories[index]['color']),
                ),
                const SizedBox(height: 5),
                Text(categories[index]['name'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
