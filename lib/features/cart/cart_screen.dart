import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/cart_provider.dart';
import 'order_tracking_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('سلة المشتريات'),
          backgroundColor: const Color(0xFF007A33),
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) {
                  var item = cart.items.values.toList()[i];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text('السعر: ${item.price} ريال'),
                      trailing: const Icon(Icons.shopping_bag, color: Color(0xFF007A33)),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('الإجمالي:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('${cart.totalAmount} ريال', style: const TextStyle(fontSize: 20, color: Colors.green)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007A33), padding: const EdgeInsets.all(15)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => const OrderTrackingScreen()));
                      },
                      child: const Text('تأكيد الطلب الآن', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
