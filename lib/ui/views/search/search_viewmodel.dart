import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/searchservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SearchBottomSheetViewModel extends BaseViewModel {
  List<Bag> bagsList = [];
  TextEditingController editingController = TextEditingController();
  Bag? currentBag;
  final bagRef = FirebaseFirestore.instance.collection('bags');
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();
  final navigatorService = locator<NavigationService>();
  var queryResultSet = [];
  var tempSearchStore = [];


  Future <void> searchListOfBags(value) async {
    if (value.length == 0){
      queryResultSet = [];
      tempSearchStore = [];
    }
    var capitalizedValue = value.substring(0,1).toUpperCase() + value.substring(1);
    if(queryResultSet.length == 0 && value.length == 1){
      SearchService().searchByName(value).then((QuerySnapshot docs){
        for(int i = 0; i< docs.docs.length; ++i){
          queryResultSet.add(docs.docs[i].data);
        }
      });
    }
    else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startWith(capitalizedValue)){
          tempSearchStore.add(element);
        }
      });
    }
  }

  Future searchBag(query)async{
    setBusy(true);
    bagsList= await apiService.searchListOfBags(query);
    notifyListeners();
    setBusy(false);
  }


}
