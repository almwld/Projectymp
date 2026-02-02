import 'dart:convert';
import 'package:http/http.dart' as http;

class WhatsAppService {
  // إعدادات API من Meta (ستحتاج لوضع التوكين الخاص بك هنا)
  static const String _baseUrl = "https://graph.facebook.com/v18.0/";
  static const String _phoneNumberId = "YOUR_PHONE_NUMBER_ID"; 
  static const String _accessToken = "YOUR_ACCESS_TOKEN";

  static Future<void> sendAutoMessage({
    required String customerPhone,
    required String productName,
    required String price,
  }) async {
    final url = Uri.parse("$_baseUrl$_phoneNumberId/messages");
    
    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $_accessToken",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "messaging_product": "whatsapp",
        "to": customerPhone,
        "type": "template",
        "template": {
          "name": "order_confirmation", // القالب المعتمد في Meta
          "language": {"code": "ar"},
          "components": [
            {
              "type": "body",
              "parameters": [
                {"type": "text", "text": productName},
                {"type": "text", "text": price},
              ]
            }
          ]
        }
      }),
    );

    if (response.statusCode == 200) {
      print("تم إرسال إشعار واتساب بنجاح ✅");
    } else {
      print("فشل في الإرسال: ${response.body}");
    }
  }
}
