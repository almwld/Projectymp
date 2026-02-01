import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewsSection extends StatelessWidget {
  final String productId;
  const ReviewsSection({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('آراء المشترين', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('products')
              .doc(productId)
              .collection('reviews')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();
            if (snapshot.data!.docs.isEmpty) return const Text('لا توجد تقييمات بعد. كن أول من يقيم!');

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var review = snapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Row(
                      children: List.generate(5, (i) => Icon(
                        Icons.star, 
                        size: 14, 
                        color: i < review['rating'] ? Colors.orange : Colors.grey
                      )),
                    ),
                    subtitle: Text(review['comment']),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
