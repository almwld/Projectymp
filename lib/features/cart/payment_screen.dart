import 'package:flutter/material.dart';
import '../../core/services/whatsapp_service.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إتمام الدفع الآمن"), backgroundColor: const Color(0xFF1A237E), foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text("سيصلك إشعار فوري عبر واتساب", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // استدعاء الـ API الداخلي
                await WhatsAppService.sendAutoMessage(
                  customerPhone: "967...", // رقم العميل
                  productName: "عسل سدر ملكي",
                  price: "45,000 ر.ي",
                );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم إرسال الفاتورة لهاتفك!")));
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A237E), padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              child: const Text("تأكيد العملية", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
