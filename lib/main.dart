import "package:provider/provider.dart";
import "core/cart_provider.dart";
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ملاحظة: الويب يتطلب إعدادات إضافية، سنشغل التطبيق حالياً بدون توقف
  try { await Firebase.initializeApp(); } catch (e) { print(e); }
  // استدعاء حقن البيانات مرة واحدة
  // import "inject_data.dart"; 
  // await injectYemenData();
  runApp(ChangeNotifierProvider(create: (ctx) => CartProvider(), child: const YemenMarketApp()));
}

class YemenMarketApp extends StatelessWidget {
  const YemenMarketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سوق اليمن',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF007A33), // أخضر يمني أصيل
        brightness: Brightness.light,
        fontFamily: "Cairo",
      ),
      home: const HomeScreen(),
    );
  }
}
