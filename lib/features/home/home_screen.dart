import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سوق اليمن - Yemen Market', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4, // تجريبي
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.grey[200], child: const Icon(Icons.shopping_bag, size: 50))),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('منتج يمني أصيل', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('١٥٠٠ ريال', style: TextStyle(color: Colors.green[700])),
              ],
            ),
          );
        },
      ),
    );
  }
}
