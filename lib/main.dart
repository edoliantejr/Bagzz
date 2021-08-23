import 'package:bagzz/ui/views/cart/cart_screen_view_model.dart';
import 'package:bagzz/ui/views/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'core/service/navigation/navigator_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  final navigationService = locator<NavigationService>();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: StackedRouter().onGenerateRoute,
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartScreenViewModel>.nonReactive(
        viewModelBuilder: () => CartScreenViewModel(),
        builder: (context, model, child) {
          return MainScreen();
        });
  }
}
