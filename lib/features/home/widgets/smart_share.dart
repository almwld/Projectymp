import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class SmartShare {
  static final ScreenshotController screenshotController = ScreenshotController();

  static void shareProduct(BuildContext context, Map<String, dynamic> product) async {
    // التقاط صورة مصغرة للإعلان كبطاقة احترافية
    await screenshotController.captureFromWidget(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(product['imageUrl'], height: 200, width: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(product['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('${product['price']} ريال', style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 10),
            const Text('شاهد التفاصيل في تطبيق Yemen Market Flex', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    ).then((capturedImage) async {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/share_image.png').create();
      await imagePath.writeAsBytes(capturedImage);

      // مشاركة الصورة المجمعة مع نص ترويجي
      await Share.shareXFiles([XFile(imagePath.path)], text: 'ألقِ نظرة على هذا العرض في تطبيق Yemen Market Flex!');
    });
  }
}
