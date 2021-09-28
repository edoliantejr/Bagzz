import 'package:bagzz/core/service/notification_service/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServiceImpl extends LocalNotificationService {
  final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  @override
  void pushNotificationReceiverHandler({required RemoteMessage message}) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channelId',
      'channelName',
      'channelDescription',
      importance: Importance.max,
      priority: Priority.high,
    );

    final platformNotificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      platformNotificationDetails,
    );
  }
}
