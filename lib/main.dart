import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/pre_loader_screen/pre_loader_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'core/service/navigation/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final navigationService = locator<NavigationService>();

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
