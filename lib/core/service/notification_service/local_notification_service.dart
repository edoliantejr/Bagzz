import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LocalNotificationService {
  Future<void> pushNotificationReceiverHandler(
      {required RemoteMessage message});
}
