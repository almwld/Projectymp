import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إتمام الدفع الآمن"),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("اختر وسيلة الدفع المحلية", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildPaymentMethod("الكريمي (M-Kureimi)", Icons.account_balance_wallet, Colors.lightBlue),
            _buildPaymentMethod("فلوسك (Floosak)", Icons.payments, Colors.green),
            _buildPaymentMethod("جوالي (Jawaly)", Icons.phone_android, Colors.orange),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
              child: Column(
                children: [
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("الإجمالي:"), Text("50,000 ر.ي", style: TextStyle(fontWeight: FontWeight.bold))]),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("جاري معالجة الدفع عبر النظام الآمن..."))),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A237E), minimumSize: const Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    child: const Text("تأكيد وإرسال الطلب 🇾🇪", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String name, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(15)),
      child: Row(children: [Icon(icon, color: color), const SizedBox(width: 15), Text(name, style: const TextStyle(fontWeight: FontWeight.w500)), const Spacer(), const Icon(Icons.arrow_forward_ios, size: 16)]),
    );
  }
}
