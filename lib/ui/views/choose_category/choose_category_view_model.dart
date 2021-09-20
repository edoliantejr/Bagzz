import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/category.dart';
import 'package:stacked/stacked.dart';

class ChooseCategoryViewModel extends BaseViewModel {
  List<Category> categories = [];
  StreamSubscription? categorySubscription;

  final apiService = locator<ApiService>();
  final navigatorService = locator<NavigationService>();

  init() async {
    setBusy(true);
    getAllCategories();
    setBusy(false);
  }

  @override
  void dispose() {
    categorySubscription!.cancel();
    super.dispose();
  }

  getAllCategories() async {
    apiService.getRealTimeCategories().listen((event) {
      categorySubscription?.cancel();
      categorySubscription =
          apiService.getRealTimeCategories().listen((categoryList) {
        categories = categoryList;
        notifyListeners();
      });
    });
  }

  setCategory(String category) {
    navigatorService.pop(returnValue: category);
  }
}
