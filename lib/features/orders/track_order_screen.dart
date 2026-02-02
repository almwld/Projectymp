import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تتبع طلبك مباشر"), backgroundColor: const Color(0xFF1A237E), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStep("تم استلام الطلب", "صنعاء - المركز الرئيسي", true, true),
            _buildStep("جاري التجهيز", "تغليف ملكي فاخر", true, true),
            _buildStep("مع المندوب", "في الطريق إليك", true, false),
            _buildStep("تم التوصيل", "نتمنى لك يوماً سعيداً", false, false),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String sub, bool isDone, bool showLine) {
    return Row(
      children: [
        Column(children: [
          Icon(isDone ? Icons.check_circle : Icons.radio_button_unchecked, color: isDone ? Colors.green : Colors.grey),
          if (showLine) Container(width: 2, height: 50, color: isDone ? Colors.green : Colors.grey.shade300),
        ]),
        const SizedBox(width: 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDone ? Colors.black : Colors.grey)),
          Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ]),
      ],
    );
  }
}
