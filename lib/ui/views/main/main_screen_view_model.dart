import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/ui/views/cart/cart_page_view.dart';
import 'package:bagzz/ui/views/search/search_view.dart';
import 'package:bagzz/ui/views/wishlist/wishlist_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked.dart';

import '../../../main.dart';

class MainScreenViewModel extends BaseViewModel {
  int numCartItems = 0;
  int currentIndex = 0;
  String name = '';
  String email = '';
  String imageUrl = '';
  ScrollController scrollController = new ScrollController();
  StreamSubscription? userSubscription;

  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigatorService = locator<NavigationService>();
  final apiService = locator<ApiService>();
  final fireBaseAuthService = locator<FireBaseAuthService>();
  final dialogService = locator<DialogService>();

  @override
  void dispose() {
    userSubscription!.cancel();
    scrollController.dispose();
    super.dispose();
  }

  void init() async {
    getUserDetails();
    subscribeToTopic();
    await updateToken();
    await checkAppLaunchDetails();
  }

  void subscribeToTopic() {
    FirebaseMessaging.instance.subscribeToTopic('BAG_TOPIC');
  }

  Future<void> checkAppLaunchDetails() async {
    ///handles opening the app from terminated state
    ///when flutter local notification is clicked
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails!.didNotificationLaunchApp) {
      final payload = notificationAppLaunchDetails.payload;
      final bag = await apiService.getBagDetails(bagId: payload!);
      navigatorService.pushNamed(Routes.BagItemDetailsPage,
          arguments: BagItemDetailsPageArguments(bag: bag));
    }
  }

  Future<void> updateToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null)
      await fireBaseAuthService.saveTokenToDatabase(token: token);
  }

  void getUserDetails() {
    apiService.getCurrentUser().listen((event) {
      userSubscription?.cancel();
      userSubscription = apiService.getCurrentUser().listen((user) {
        name = user.name;
        email = user.email;
        imageUrl = user.image;
        notifyListeners();
      });
    });
  }

  void onTabChange(int index, BuildContext context) {
    currentIndex = index;
    notifyListeners();
    //show search
    if (index == 1) {
      SearchBottomSheet.open(context, []);
    }
    //show wishlist
    if (index == 2) {
      WishListPage.open(context);
    }
    //show cart bottom sheet
    if (index == 3) {
      CartPage.open(context);
    }
  }

  void logout() async {
    await firebaseAuthService.logOut();
    navigatorService.pushReplacementNamed(Routes.LogIn);
  }
}
