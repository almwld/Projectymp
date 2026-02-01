import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static Future initialize() async {
    // طلب الإذن في iOS و Android 13+
    NotificationSettings settings = await _fcm.requestPermission();
    
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('تم تفعيل الإشعارات بنجاح');
      
      // الحصول على التوكن (Token) الخاص بالجهاز لإرسال إشعارات له
      String? token = await _fcm.getToken();
      print("Device Token: $token");
    }
  }
}
