import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel {
  int numCartItems = 0;
  int currentIndex = 0;
  ScrollController scrollController = new ScrollController();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  final apiService = locator<ApiService>();
  User? currentUser;
  StreamSubscription? userSubscription;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  init() {
    setBusy(true);
    getUserDetails();
    setBusy(false);
  }

  getUserDetails() {
    apiService.getCurrentUser().listen((event) {
      userSubscription?.cancel();
      userSubscription = apiService.getCurrentUser().listen((user) {
        currentUser = user;
        notifyListeners();
      });
    });
    // user = await apiService.getCurrentUser();
  }

  void goToPublishBag() async {
    // await navigationService.pop();
    navigationService.pushNamedAndRemoveUntil(Routes.BagUpload,
        predicate: (dynamic) => true);
  }
}
