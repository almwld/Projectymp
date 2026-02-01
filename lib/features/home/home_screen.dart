import 'widgets/recommendation_section.dart';
import 'widgets/category_list.dart';
import 'widgets/stories_bar.dart';
import 'widgets/stories_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_details_screen.dart';
import 'add_post_screen.dart';
import '../auth/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedCity = 'الكل'; // فلتر المحافظة الافتراضي

  final List<String> _yemenCities = ['الكل', 'صنعاء', 'عدن', 'تعز', 'حضرموت', 'إب', 'الحديدة', 'مأرب'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _selectedIndex == 0 ? AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF007A33),
        title: DropdownButton<String>(
          value: _selectedCity,
          dropdownColor: const Color(0xFF007A33),
          icon: const Icon(Icons.location_on, color: Colors.white),
          underline: Container(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCity = newValue!;
            });
          },
          items: _yemenCities.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        centerTitle: true,
      ) : null,
      body: _selectedIndex == 0 ? _buildHomeBody() : (_selectedIndex == 1 ? const AddPostScreen() : const ProfileScreen()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFF007A33),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'أضف إعلان'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }

  Widget _buildHomeBody() {
    // إضافة شريط القصص
    Widget storiesSection = const YemenStoriesBar();
    // إضافة شريط القصص
    Widget storiesSection = const YemenStoriesBar();
    // تجهيز الاستعلام بناءً على المحافظة المختارة
    Query productsQuery = FirebaseFirestore.instance.collection('products').orderBy('createdAt', descending: true);
    
    if (_selectedCity != 'الكل') {
      productsQuery = productsQuery.where('city', isEqualTo: _selectedCity);
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: const Color(0xFF007A33),
        storiesSection,
        const ExtendedCategoryBar(),
        storiesSection,
        const ExtendedCategoryBar(),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'ابحث في $_selectedCity...',
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
          ),
        ),
        const RecommendationSection(),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: productsQuery.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('لا توجد إعلانات في $_selectedCity حالياً'));
              }

              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return _ProductCard(data: data);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const _ProductCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: data))),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        const RecommendationSection(),
            Expanded(child: Container(color: Colors.grey[200], width: double.infinity, child: Image.network(data['imageUrl'], fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['name'] ?? 'منتج', style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text('${data['price']} ريال', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 12, color: Colors.grey),
                      Text(data['city'] ?? 'صنعاء', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
