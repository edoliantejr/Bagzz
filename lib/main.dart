import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/core/service/notification_service/local_notification_service.dart';
import 'package:bagzz/ui/views/pre_loader_screen/pre_loader_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'core/service/navigation/navigator_service.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final navigationService = locator<NavigationService>();
final notificationService = locator<LocalNotificationService>();

Future<void> backgroundNotificationHandler(RemoteMessage remoteMessage) async {
  notificationService.pushNotificationReceiverHandler(message: remoteMessage);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  const initializationSettingsIOS = IOSInitializationSettings();
  const initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {});

  FirebaseMessaging.onBackgroundMessage(backgroundNotificationHandler);

  runApp(GetMaterialApp(
    theme: ThemeData(
        fontFamily: FontNames.workSans,
        accentColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent)),
    debugShowCheckedModeBanner: false,
    home: PreLoaderScreen(),
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: StackedRouter().onGenerateRoute,
  ));
}
