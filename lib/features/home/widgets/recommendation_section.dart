import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../../core/cart_provider.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var doc = snapshot.data!.docs[index];
            var product = doc.data() as Map<String, dynamic>;
            
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Color(0xFF007A33), child: Icon(Icons.shopping_bag, color: Colors.white)),
                title: Text(product['name'] ?? 'منتج يمني', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${product['price'] ?? '0'} ريال يمني", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  icon: const Icon(Icons.add_shopping_cart, color: Color(0xFF007A33)),
                  onPressed: () {
                    cart.addItem(doc.id, product['name'], product['price'] ?? 0);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم إضافة ${product['name']} إلى السلة'), duration: const Duration(seconds: 1)),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
