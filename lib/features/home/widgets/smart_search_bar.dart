import 'package:flutter/material.dart';

class SmartSearchBar extends StatelessWidget {
  const SmartSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "ابحث عن بن، عسل، أو هدايا...",
          prefixIcon: const Icon(Icons.search, color: Color(0xFF1A237E)),
          suffixIcon: const Icon(Icons.mic_none, color: Colors.grey), // للبحث الصوتي مستقبلاً
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
        onChanged: (value) {
          // هنا سيتم ربط البحث التلقائي مع قاعدة البيانات
          print("البحث عن: $value");
        },
      ),
    );
  }
}
