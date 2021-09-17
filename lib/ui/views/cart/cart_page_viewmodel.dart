import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:stacked/stacked.dart';

class CartPageViewModel extends BaseViewModel {
  List<Bag> bagsInCart = [];
  User? currentUser;
  StreamSubscription? bagsInCartSubscription;
  StreamSubscription? userSubscription;

  final apiService = locator<ApiService>();
  final navigatorService = locator<NavigationService>();

  init() {
    setBusy(true);
    getCurrentUser();
    setBusy(false);
  }

  @override
  void dispose() {
    bagsInCartSubscription!.cancel();
    userSubscription!.cancel();
    super.dispose();
  }

  getCurrentUser() {
    apiService.getCurrentUser().listen((event) {
      userSubscription = apiService.getCurrentUser().listen((user) {
        currentUser = user;
        if (currentUser != null) {
          getUsersCart(currentUser!.id);
          notifyListeners();
        }
      });
    });
  }

  getUsersCart(String userId) {
    apiService.getAllBagsInCart(userId).listen((event) {
      bagsInCartSubscription =
          apiService.getAllBagsInCart(userId).listen((value) {
        if (value.length >= 1) {
          bagsInCart = value;
        } else {
          bagsInCart = [];
        }
        notifyListeners();
      });
    });
  }

  decrementOrDeleteBagInCartQuantity(Bag bag, String uid) {
    apiService.deleteBagInCart(bag: bag, uid: uid);
  }

  incrementBagInCartQuantity(Bag bag, String uid) {
    apiService.addToCart(bag: bag, uid: uid);
  }

  goToBagDetailsPage(Bag bag) {
    navigatorService.pushNamedAndRemoveUntil(Routes.BagItemDetailsPage,
        arguments: BagItemDetailsPageArguments(bag: bag),
        predicate: (dynamic) => true);
  }
}
