import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:stacked/stacked.dart';

class BagGridViewModel extends BaseViewModel {
  final navigatorService = locator<NavigationService>();
  final snackBarService = locator<SnackBarService>();
  final apiService = locator<ApiService>();
  List<Bag> bagsList = [];
  StreamSubscription? listOfBagStreamSubscription;
  User? currentUser;

  Future<void> init() async {
    setBusy(true);
    await getCurrentUser();
    getBagsRealtime();
    setBusy(false);
  }

  void onBagImagePressed(Bag bag) {
    navigatorService.pushNamed(Routes.BagItemDetailsPage,
        arguments: BagItemDetailsPageArguments(bag: bag));
  }

  Future<void> addToWishList(String id) async {
    await getCurrentUser();

    if (currentUser!.favoriteBags.contains(id)) {
      ///remove, already added
      currentUser!.favoriteBags.remove(id);
    } else {
      currentUser!.favoriteBags.add(id);
    }

    await apiService.updateUser(currentUser!);
  }

  Future<void> getCurrentUser() async {
    currentUser = await apiService.getCurrentUser();
    notifyListeners();
  }

  void getBagsRealtime() {
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

  bool isFavorite(Bag bag) {
    getCurrentUser();
    return currentUser!.favoriteBags.contains(bag.id);
  }
}
