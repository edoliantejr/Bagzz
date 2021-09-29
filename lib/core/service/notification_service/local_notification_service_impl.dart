import 'package:bagzz/core/service/notification_service/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServiceImpl extends LocalNotificationService {
  final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  @override
  Future<void> pushNotificationReceiverHandler(
      {required RemoteMessage message}) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'Bag', 'Bag Notification', 'New bag notification',
        importance: Importance.max, priority: Priority.high);

    final NotificationDetails platformNotificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    final messageData = message.data;

    await flutterLocalNotificationPlugin.show(
      messageData['notificationId'] ?? 0,
      messageData['title'] ?? message.notification!.title ?? '',
      messageData['body'] ?? message.notification!.body ?? '',
      platformNotificationDetails,
    );
  }
}
