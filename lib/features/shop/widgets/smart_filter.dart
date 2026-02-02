import 'package:flutter/material.dart';

class SmartFilterBar extends StatelessWidget {
  final Function(String) onFilterSelected;
  const SmartFilterBar({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          _filterChip("الكل", Icons.grid_view),
          _filterChip("الأكثر مبيعاً", Icons.local_fire_department),
          _filterChip("السعر: من الأقل", Icons.trending_down),
          _filterChip("وصل حديثاً", Icons.new_releases),
          _filterChip("تقييم عالي", Icons.star),
        ],
      ),
    );
  }

  Widget _filterChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        avatar: Icon(icon, size: 16, color: const Color(0xFF1A237E)),
        label: Text(label),
        onPressed: () => onFilterSelected(label),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
