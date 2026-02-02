import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductDetailsScreen({
    super.key, 
    required this.title, 
    required this.price, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // هيدر متحرك مع صورة المنتج
          SliverAppBar(
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: title,
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
            backgroundColor: const Color(0xFF1A237E),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(price, style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("وصف المنتج", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    "هذا المنتج من أجود الأنواع اليمنية الأصيلة، تم اختياره بعناية فائقة لضمان الجودة والطعم الفريد. متوفر الآن بضمان يمن ماركت.",
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  // مواصفات سريعة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfo(Icons.verified, "أصلي 100%"),
                      _buildInfo(Icons.local_shipping, "توصيل سريع"),
                      _buildInfo(Icons.Security, "دفع آمن"),
                    ],
                  ),
                  const SizedBox(height: 100), // مساحة للزر السفلي
                ],
              ),
            ),
          ),
        ],
      ),
      // زر الإضافة للسلة الثابت في الأسفل
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A237E),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text("أضف إلى السلة 🛒", style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildInfo(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFC6AF5C)),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
