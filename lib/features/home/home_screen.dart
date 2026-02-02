import 'package:flutter/material.dart';
import 'widgets/product_card.dart';
import 'widgets/floating_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverAppBar(
              expandedHeight: 160, pinned: true, elevation: 0,
              backgroundColor: const Color(0xFF1A237E),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF1A237E), Color(0xFF0D1440)]))),
                title: const Text("يمن ماركت فليكس", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(children: [
                  _bento("عسل سدر", Icons.hive, Colors.orange),
                  const SizedBox(width: 10),
                  _bento("بن خولاني", Icons.coffee, Colors.brown),
                ]),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
              delegate: SliverChildBuilderDelegate((c, i) => const PremiumProductCard(title: "منتج ملكي", price: "40,000 ر.ي", imageUrl: "https://picsum.photos/300"), childCount: 4),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ]),
          const Align(alignment: Alignment.bottomCenter, child: FloatingGlassNav()),
        ],
      ),
    );
  }
  Widget _bento(String t, IconData i, Color c) => Expanded(child: Container(height: 70, decoration: BoxDecoration(color: c.withOpacity(0.1), borderRadius: BorderRadius.circular(15), border: Border.all(color: c.withOpacity(0.2))), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, color: c, size: 20), const SizedBox(width: 8), Text(t, style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13))])));
}
