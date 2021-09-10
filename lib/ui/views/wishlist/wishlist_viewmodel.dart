import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class WishlistViewModel extends BaseViewModel {
  List<Bag> bagsList = [];
  User? _user;
  final bagRef = FirebaseFirestore.instance.collection('bags');
  final apiService = locator<ApiService>();
  StreamSubscription? listOfLikedBag;

  Future<void> getCurrentUser() async {
    _user = await apiService.getCurrentUser();
  }

  void init() async {
    setBusy(true);
    await getCurrentUser();
    await getLikedBags();
    setBusy(false);
  }

  Future<void> getLikedBags() async {
    List<String> userLikedIds = [];
    if (_user!.favoriteBags.isNotEmpty) {
      userLikedIds = _user!.favoriteBags;
    } else {
      userLikedIds = ['not found'];
    }

    bagsList = await apiService.getLikeBags(userLikedIds);
    notifyListeners();
  }
}
