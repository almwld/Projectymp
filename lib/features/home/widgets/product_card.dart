import "../../cart/payment_screen.dart";
import 'package:flutter/material.dart';

class PremiumProductCard extends StatelessWidget {
  final String title, price, imageUrl;
  const PremiumProductCard({required this.title, required this.price, required this.imageUrl, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Container(decoration: BoxDecoration(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)))),
            Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
              Text(price, style: const TextStyle(color: Color(0xFF1A237E), fontWeight: FontWeight.w900, fontSize: 15)),
            ])),
          ]),
          Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.verified, color: Color(0xFFC6AF5C), size: 14))),
        ],
      ),
    );
  }
}
