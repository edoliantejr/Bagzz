import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LocalNotificationService {
  void pushNotificationReceiverHandler({required RemoteMessage message});
}
