import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // طلب الإذن من المستخدم (خاصة في iOS)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('تم تفعيل الإشعارات بنجاح!');
      
      // الحصول على الـ Token الخاص بالجهاز لإرسال إشعارات مخصصة لهذا المستخدم
      String? token = await _fcm.getToken();
      print("Device Token: $token");
    }

    // التعامل مع الإشعارات أثناء فتح التطبيق
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('وصل إشعار جديد: ${message.notification?.title}');
    });
  }
}
