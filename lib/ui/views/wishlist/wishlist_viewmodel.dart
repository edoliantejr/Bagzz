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
  final bagRef = FirebaseFirestore.instance.collection('bags');
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();
  final navigatorService = locator<NavigationService>();

  Future<void> init() async {
    setBusy(true);
    await getCurrentUser();
    await getLikedBags();
    notifyListeners();
    setBusy(false);
  }

  Future<void> getCurrentUser() async {
    currentUser = await apiService.getCurrentUser();
  }

  Future getLikedBags() async {
    await getCurrentUser();
    List<String> userLikedIds = [''];
    if (currentUser!.favoriteBags.isNotEmpty) {
      userLikedIds = await currentUser!.favoriteBags;
    }
    bagsList = await apiService.getLikeBags(userLikedIds);
    notifyListeners();
  }

  Future updateLikedBags() async {
    await apiService.updateUser(currentUser!);
    await getCurrentUser();
    bagsList = await apiService.getLikeBags(currentUser!.favoriteBags);
  }

  Future deleteLikedBag(String id) async {
    dialogService.showLoadingDialog(message: 'Removing..', willPop: true);
    if (currentUser!.favoriteBags.contains(id)) {
      await currentUser!.favoriteBags.remove(id);
    }
    await updateLikedBags();
    Get.back(canPop: false);
    notifyListeners();
  }
}
