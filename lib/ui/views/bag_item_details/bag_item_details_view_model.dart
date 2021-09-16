import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class BagItemDetailsViewModel extends BaseViewModel {
  final Bag bag;
  User? currentUser;
  List<String> likedBags = [];
  StreamSubscription? userSubscription;

  final apiService = locator<ApiService>();
  final snackBarService = locator<SnackBarService>();
  final dialogService = locator<DialogService>();

  BagItemDetailsViewModel({required this.bag});

  List<String> bagInfoMenu = [
    'Description',
    'Shipping Info',
    'Payment Options'
  ];
  int currentIndex = 0;
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  setCurrentIndex(int index) {
    setBusy(true);
    currentIndex = index;
    setBusy(false);
  }

  @override
  void dispose() {
    pageController.dispose();
    userSubscription!.cancel();
    super.dispose();
  }

  init() {
    setBusy(true);
    getCurrentUser();
    setBusy(false);
  }

  getCurrentUser() {
    apiService.getCurrentUser().listen((event) {
      userSubscription?.cancel();
      userSubscription = apiService.getCurrentUser().listen((user) {
        currentUser = user;
        likedBags = currentUser!.favoriteBags;
        notifyListeners();
      });
    });
  }

  bool isFavorite(String id) {
    bool isFav;
    if (likedBags.length > 0) {
      isFav = currentUser!.favoriteBags.contains(id);
    } else {
      isFav = false;
    }
    return isFav;
  }

  addToCart(Bag bag, String uid) async {
    dialogService.showLoadingDialog(message: 'Adding..', willPop: true);
    await apiService.addToCart(bag: bag, uid: uid);
    Get.back(canPop: false);
  }
}
