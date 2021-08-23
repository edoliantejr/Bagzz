import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagBannerSliderViewModel extends BaseViewModel {
  final List<Bag> bags;
  final PageController controller = PageController(initialPage: 0);

  BagBannerSliderViewModel(this.bags);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
