import "../../core/cart_provider.dart";
import "package:provider/provider.dart";
import "../cart/cart_screen.dart";
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/yemen_stories_bar.dart';
import 'widgets/recommendation_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _addNewStory(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('إضافة عرض جديد للسوق 🇾🇪', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'مثلاً: عسل سدر دوعني فاخر',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007A33), padding: const EdgeInsets.all(15)),
                  onPressed: () async {
                    if (controller.text.isNotEmpty) {
                      await FirebaseFirestore.instance.collection('stories').add({
                        'title': controller.text,
                        'image': 'https://bit.ly/yemen-market-icon',
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('نشر الآن', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          title: const Text('يمن ماركت فليكس', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: const Color(0xFF007A33),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YemenStoriesBar(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("توصيات ذكية لك", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const RecommendationSection(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _addNewStory(context),
          backgroundColor: const Color(0xFF007A33),
          label: const Text('إضافة عرض', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
        ),
      ),
    );
  }
}
