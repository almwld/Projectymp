import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تتبع مباشر - يمن ماركت'),
          backgroundColor: const Color(0xFF007A33),
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            // محاكاة الخريطة (Map Preview)
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[200],
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // خلفية الخريطة (صورة افتراضية لشوارع صنعاء)
                  Icon(Icons.map, size: 200, color: Colors.grey[400]),
                  // موقع المحل (صنعاء - حدة)
                  const Positioned(
                    top: 50, right: 100,
                    child: Column(children: [Icon(Icons.store, color: Colors.blue, size: 40), Text("محل العسل")]),
                  ),
                  // الموصل (الموتور) - متحرك
                  const Positioned(
                    bottom: 100, left: 120,
                    child: Icon(Icons.delivery_dining, color: Color(0xFF007A33), size: 50),
                  ),
                  // موقع العميل
                  const Positioned(
                    bottom: 40, left: 50,
                    child: Column(children: [Icon(Icons.location_on, color: Colors.red, size: 40), Text("موقعك")]),
                  ),
                ],
              ),
            ),
            // تفاصيل الحالة
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage('https://bit.ly/yemen-driver')),
                      title: Text("الموصل: محمد القاسمي"),
                      subtitle: Text("على متن دراجة نارية - صنعاء"),
                      trailing: Icon(Icons.phone, color: Colors.green),
                    ),
                    const Divider(),
                    _buildStatusStep("تم استلام الطلب", true),
                    _buildStatusStep("جاري التوصيل الآن", true),
                    _buildStatusStep("وصل إلى منطقتك", false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(String title, bool isDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(isDone ? Icons.check_circle : Icons.radio_button_unchecked, 
               color: isDone ? const Color(0xFF007A33) : Colors.grey),
          const SizedBox(width: 15),
          Text(title, style: TextStyle(color: isDone ? Colors.black : Colors.grey, fontWeight: isDone ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
