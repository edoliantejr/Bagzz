import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/ui/views/cart/cart_page_view.dart';
import 'package:bagzz/ui/views/search/search_view.dart';
import 'package:bagzz/ui/views/wishlist/wishlist_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

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

  @override
  void dispose() {
    userSubscription!.cancel();
    scrollController.dispose();
    super.dispose();
  }

  void init() {
    getUserDetails();
    subscribeToTopic();
  }

  void subscribeToTopic() {
    FirebaseMessaging.instance.subscribeToTopic('BAG_TOPIC');
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
