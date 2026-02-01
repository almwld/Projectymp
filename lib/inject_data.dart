import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> injectYemenData() async {
  final firestore = FirebaseFirestore.instance;

  // إضافة منتجات تجريبية
  List<Map<String, dynamic>> dummyProducts = [
    {'name': 'عسل سدر دوعني ملكي', 'price': 50000, 'category': 'عسل'},
    {'name': 'بن خولاني مطرّي درجة أولى', 'price': 12000, 'category': 'بن'},
    {'name': 'بخور عدني (عرائسي)', 'price': 8000, 'category': 'بخور'},
    {'name': 'جنبية صيفاني قديم (عرض)', 'price': 150000, 'category': 'تحف'},
  ];

  for (var product in dummyProducts) {
    await firestore.collection('products').add(product);
  }

  // إضافة قصص (Stories)
  List<String> dummyStories = ['تخفيضات صنعاء', 'جديد عدن', 'عروض إب', 'منتجات تعز'];
  for (var title in dummyStories) {
    await firestore.collection('stories').add({
      'title': title,
      'image': 'https://bit.ly/yemen-market-icon',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
  print('✅ تم بنجاح حقن بيانات يمن ماركت فليكس!');
}
