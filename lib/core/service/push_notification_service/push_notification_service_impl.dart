import 'package:bagzz/core/service/push_notification_service/push_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationServiceImpl extends PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future initializePushNotification() async {
    // NotificationSettings settings = await _firebaseMessaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    //  _firebaseMessaging.
    throw UnimplementedError();
  }
}
