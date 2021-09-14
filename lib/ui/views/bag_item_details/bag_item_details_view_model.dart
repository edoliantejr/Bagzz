import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagItemDetailsViewModel extends BaseViewModel {
  final Bag bag;
  User? currentUser;
  final apiService = locator<ApiService>();
  final snackBarService = locator<SnackBarService>();
  StreamSubscription? userSubscription;

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
    super.dispose();
  }

  init() {
    setBusy(true);
    getCurrentUser();
    setBusy(false);
  }

  void addBagToCart() {
    // apiService.addToCart(bag);
    // snackBarService.showSnackBar('Bag added to cart');
  }

  getCurrentUser() {
    apiService.getCurrentUser().listen((event) {
      userSubscription?.cancel();
      userSubscription = apiService.getCurrentUser().listen((user) {
        currentUser = user;
        notifyListeners();
        isFavorite();
      });
    });

    // currentUser = await apiService.getCurrentUser();
  }

  bool isFavorite() {
    return currentUser!.favoriteBags.contains(bag.id);
  }
}
