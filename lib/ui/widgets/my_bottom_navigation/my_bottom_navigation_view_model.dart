import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';

class MyBottomNavigationViewModel extends BaseViewModel {
  final apiService = locator<ApiService>();
  Map<Bag, int> shoppingCart = {};

  late StreamSubscription<Map<Bag, int>> streamSubscription;

  init() {
    // listen for every cart changes and update the navigation cart icon count
    // streamSubscription = apiService.getCart().listen((latestCart) {
    //   shoppingCart = latestCart;
    //   notifyListeners();
    // });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }
}
