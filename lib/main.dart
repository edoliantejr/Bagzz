import 'dart:io';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/ui/views/pre_loader_screen/pre_loader_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'core/service/navigation/navigator_service.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final navigationService = locator<NavigationService>();

Future<void> backgroundNotificationHandler(RemoteMessage remoteMessage) async {
  pushNotificationReceiverHandler(message: remoteMessage);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final apiService = locator<ApiService>();
  const initializationSettingsIOS = IOSInitializationSettings();
  const initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (dynamic payload) async {
    if (payload != null) {
      final bag = await apiService.getBagDetails(bagId: payload);
      navigationService.pushNamed(Routes.BagItemDetailsPage,
          arguments: BagItemDetailsPageArguments(bag: bag));
    } else {
      navigationService.pushNamed(Routes.PreLoaderScreen);
    }
  });

  ///show notification when app is on background
  FirebaseMessaging.onBackgroundMessage(backgroundNotificationHandler);

  configureFireBaseMessaging();
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

Future<void> pushNotificationReceiverHandler(
    {required RemoteMessage message}) async {
  final String largeIconPath =
      await _downloadAndSaveFile(message.data['image_url'], 'largeIcon');
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'Bag',
    'Bag Notification',
    'New bag notification',
    importance: Importance.max,
    priority: Priority.high,
    largeIcon: FilePathAndroidBitmap(largeIconPath),
  );

  final NotificationDetails platformNotificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  final messageData = message.data;

  await flutterLocalNotificationsPlugin.show(
    int.tryParse(messageData['notificationId']) ?? 0,
    messageData['title'] ?? message.notification!.title ?? 'Empty',
    messageData['body'] ?? message.notification!.body ?? 'No Body',
    platformNotificationDetails,
    payload: messageData['payload'],
  );
}

Future<void> configureFireBaseMessaging() async {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    pushNotificationReceiverHandler(message: remoteMessage);
  });
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final response = await http.get(Uri.parse(url));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}
