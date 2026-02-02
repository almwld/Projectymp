import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("لوحة تحكم يمن ماركت"),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildAdminCard("الطلبات الجديدة", Icons.shopping_cart, Colors.orange, "5"),
          _buildAdminCard("إضافة منتج", Icons.add_business, Colors.green, ""),
          _buildAdminCard("إحصائيات البيع", Icons.analytics, Colors.blue, ""),
          _buildAdminCard("المستخدمين", Icons.people, Colors.purple, "120"),
        ],
      ),
    );
  }

  Widget _buildAdminCard(String title, IconData icon, Color color, String badge) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (badge.isNotEmpty) 
            Container(padding: const EdgeInsets.all(5), decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle), child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10))),
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
