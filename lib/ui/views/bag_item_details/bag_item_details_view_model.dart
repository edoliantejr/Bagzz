import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagItemDetailsViewModel extends BaseViewModel {
  final Bag bag;
  final apiNavigator = locator<ApiService>();
  final snackBarNavigator = locator<SnackBarService>();

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

  void addBagToCart() {
    apiNavigator.addToCart(bag);
    snackBarNavigator.showSnackBar('Bag added to cart');
  }
}
