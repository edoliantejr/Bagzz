import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagItemDetailsViewModel extends BaseViewModel {
  final Bag bag;

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
}
