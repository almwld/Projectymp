import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF003366),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF003366), Color(0xFF00509E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 40, backgroundColor: Colors.white24, child: Icon(Icons.person, size: 50, color: Colors.white)),
                    SizedBox(height: 10),
                    Text('يحيى محمد', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // بطاقة المحفظة (Wallet Card)
                  _buildWalletCard(),
                  const SizedBox(height: 20),
                  _buildMenuAction(Icons.inventory_2_outlined, 'إعلاناتي النشطة', '12 إعلان'),
                  _buildMenuAction(Icons.favorite_outline, 'المفضلة', '5 منتجات'),
                  _buildMenuAction(Icons.star_outline, 'تقييماتي', '4.8/5'),
                  _buildMenuAction(Icons.settings_outlined, 'إعدادات الحساب', ''),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF003366),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
          opacity: 0.1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('رصيد المحفظة', style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 5),
              const Text('25,000 ريال', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
            child: const Text('شحن رصيد'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuAction(IconData icon, String title, String trailing) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF003366)),
      title: Text(title),
      trailing: Text(trailing, style: const TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }
}
