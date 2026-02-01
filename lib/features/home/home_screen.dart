import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سوق اليمن الممتاز', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {})],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Text('مرحباً بك في أول منصة تجارية متكاملة لليمن', textAlign: TextAlign.center),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10
              ),
              itemCount: 4,
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.grey[300], child: const Icon(Icons.image, size: 50))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('منتج يمني ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Text('السعر: 5000 ريال'),
                    ElevatedButton(onPressed: () {}, child: const Text('أضف للسلة'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
