import 'package:flutter/material.dart';

class YemenStoriesBar extends StatelessWidget {
  const YemenStoriesBar({super.key});

  final List<Map<String, String>> stories = const [
    {'name': 'عسل دوعني', 'image': 'https://images.unsplash.com/photo-1589733955941-5eeaf752f6dd?q=80&w=200'},
    {'name': 'بن خولاني', 'image': 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?q=80&w=200'},
    {'name': 'جنبية صيفاني', 'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=200'},
    {'name': 'عقارات صنعاء', 'image': 'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?q=80&w=200'},
    {'name': 'سيارات للبيع', 'image': 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=200'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(stories[index]['image']!),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(stories[index]['name']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
