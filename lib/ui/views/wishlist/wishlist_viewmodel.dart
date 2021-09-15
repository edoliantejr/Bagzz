import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class WishlistViewModel extends BaseViewModel {
  List<Bag> bagsList = [];
  User? currentUser;
  StreamSubscription? getLikeBagSubscription;
  StreamSubscription? userSubscription;

  final bagRef = FirebaseFirestore.instance.collection('bags');
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();
  final navigatorService = locator<NavigationService>();

  init() async {
    setBusy(true);
    getCurrentUser();
    setBusy(false);
  }

  getCurrentUser() {
    apiService.getCurrentUser().listen((event) {
      userSubscription?.cancel();
      userSubscription = apiService.getCurrentUser().listen((user) {
        currentUser = user;
        getLikedBags();
        notifyListeners();
      });
    });

    // currentUser = await apiService.getCurrentUser();
  }

  getLikedBags() {
    if (currentUser!.favoriteBags.isNotEmpty) {
      apiService.getLikeBags(currentUser!.favoriteBags).listen((event) {
        getLikeBagSubscription?.cancel();
        getLikeBagSubscription = apiService
            .getLikeBags(currentUser!.favoriteBags)
            .listen((listOfBags) {
          bagsList = listOfBags;
          notifyListeners();
        });
      });
    } else {
      bagsList = [];
      notifyListeners();
    }
  }

  updateLikedBags() async {
    await apiService.updateUser(currentUser!);
    notifyListeners();
  }

  deleteLikedBag(String id) async {
    dialogService.showLoadingDialog(message: 'Removing..', willPop: true);
    if (currentUser!.favoriteBags.contains(id)) {
      currentUser!.favoriteBags.remove(id);
    }
    await updateLikedBags();
    Get.back(canPop: false);
    notifyListeners();
  }

}
