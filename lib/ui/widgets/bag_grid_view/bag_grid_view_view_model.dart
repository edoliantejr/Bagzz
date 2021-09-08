import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';

class BagGridViewModel extends BaseViewModel {
  final navigatorService = locator<NavigationService>();
  final snackBarService = locator<SnackBarService>();
  final apiService = locator<ApiService>();
  List<Bag> bagsList = [];
  StreamSubscription? listOfBagStreamSubscription;

  void onBagImagePressed(Bag bag) {
    navigatorService.pushNamed(Routes.BagItemDetailsPage,
        arguments: BagItemDetailsPageArguments(bag: bag));
  }

  void addToWishList() {
    snackBarService.showSnackBar('Bag added to wish list.');
  }

  init() async {
    setBusy(true);
    getBagsRealtime();
    await Duration(seconds: 5);
    setBusy(false);
  }

  getBagsRealtime() {
    apiService.getRealTimeBags().listen((event) {
      setBusy(true);
      listOfBagStreamSubscription?.cancel();
      listOfBagStreamSubscription = apiService.getRealTimeBags().listen((bags) {
        bagsList.clear();
        bagsList = bags;
        notifyListeners();
      });

      setBusy(false);
    });
  }
}
