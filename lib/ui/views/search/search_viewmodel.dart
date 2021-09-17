import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SearchBottomSheetViewModel extends BaseViewModel {
  List<Bag> bagsList = [];
  TextEditingController editingController = TextEditingController();
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();
  final navigatorService = locator<NavigationService>();

  Future searchBag(query)async{
    setBusy(true);
    bagsList= await apiService.searchListOfBags(query);
    notifyListeners();
    setBusy(false);
  }


  void onBagSearchPressed(Bag bag) {
    navigatorService.pushNamedAndRemoveUntil(Routes.BagItemDetailsPage,
        arguments: BagItemDetailsPageArguments(bag: bag),
    predicate: (dynamic) => true);
  }


}
