import 'dart:ui';
import 'package:flutter/material.dart';

class FloatingGlassNav extends StatelessWidget {
  const FloatingGlassNav({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A237E).withOpacity(0.85),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home_filled, color: Colors.white, size: 28),
                Icon(Icons.search, color: Colors.white60),
                Icon(Icons.shopping_bag_outlined, color: Colors.white60),
                Icon(Icons.person_outline, color: Colors.white60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
