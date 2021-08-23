import 'package:bagzz/ui/views/cart/cart_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class MainScreenViewModel extends BaseViewModel {
  int numCartItems = 0;
  int currentIndex = 0;
  ScrollController scrollController = new ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onTabChange(int index, BuildContext context) {
    currentIndex = index;
    notifyListeners();

    //show cart bottom sheet
    if (index == 3) {
      CartPage.open(context);
    }
  }
}
