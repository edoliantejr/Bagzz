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
  List<String> likedBags = [];
  StreamSubscription? listOfBagStreamSubscription;
  User? currentUser;
  StreamSubscription? userSubscription;

  init() {
    setBusy(true);
    getBagsRealtime();
    getCurrentUser();
    setBusy(false);
  }

  @override
  void dispose() {
    listOfBagStreamSubscription!.cancel();
    userSubscription!.cancel();
    super.dispose();
  }

  void onBagImagePressed(Bag bag) {
    navigatorService.pushNamed(Routes.BagItemDetailsPage,
        arguments: BagItemDetailsPageArguments(bag: bag));
  }

  addToWishList(String id) async {
    if (currentUser!.favoriteBags.contains(id)) {
      ///remove, already added
      currentUser!.favoriteBags.remove(id);
    } else {
      currentUser!.favoriteBags.add(id);
    }
    await apiService.updateUser(currentUser!);
  }

  getCurrentUser() {
    // currentUser = await apiService.getCurrentUser();
    apiService.getCurrentUser().listen((event) {
      userSubscription?.cancel();
      userSubscription = apiService.getCurrentUser().listen((user) {
        currentUser = user;
        likedBags = currentUser!.favoriteBags;
        notifyListeners();
      });
    });
  }

  void getBagsRealtime() {
    apiService.getRealTimeBags().listen((event) {
      listOfBagStreamSubscription?.cancel();
      listOfBagStreamSubscription = apiService.getRealTimeBags().listen((bags) {
        bagsList.clear();
        bagsList = bags;
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
}
