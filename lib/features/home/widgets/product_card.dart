import 'package:flutter/material.dart';
import '../../core/theme/dynamic_theme.dart';

class PremiumProductCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onTap;

  const PremiumProductCard({required this.data, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    Color categoryColor = ThemeProvider.getCategoryColor(data['category']);
    bool isVerified = data['isVerified'] ?? false; // شارة التوثيق
    String condition = data['condition'] ?? 'جديد'; // حالة المنتج

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
          border: data['isFeatured'] == true ? Border.all(color: Colors.amber, width: 2) : null,
            BoxShadow(color: categoryColor.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                  Positioned(
                    top: 10, right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.red),
                        onPressed: () { /* تفعيل التبديل هنا */ },
                      ),
                    ),
                  ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(data['imageUrl']), 
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  // ملصق حالة المنتج (جديد/مستخدم)
                  Positioned(
                    top: 10, left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(condition, style: const TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(data['name'], 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      if (isVerified) const Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text('${data['price']} ريال', 
                    style: TextStyle(color: categoryColor, fontWeight: FontWeight.w900, fontSize: 15)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('${data['views'] ?? 0}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                      const Spacer(),
                      Text(data['city'] ?? 'صنعاء', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
