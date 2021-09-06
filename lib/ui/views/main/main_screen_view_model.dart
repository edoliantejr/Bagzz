import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/mock_data.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/ui/views/cart/cart_page_view.dart';
import 'package:bagzz/ui/views/search/search_view.dart';
import 'package:bagzz/ui/views/wishlist/wishlist_view.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class MainScreenViewModel extends BaseViewModel {
  int numCartItems = 0;
  int currentIndex = 0;
  ScrollController scrollController = new ScrollController();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();

  init() {
    // TODO: testing only. Demo to add bag to cart.
    // Stream.periodic(Duration(seconds: 5)).listen((event) {
    //   locator<ApiService>()
    //       .addToCart(MOCK_BAGS[Random.secure().nextInt(MOCK_BAGS.length - 1)]);
    // });
  }

  @override
  void dispose() {
    scrollController.dispose();

    // ATOA GE CLOSE ANG GLOBAL STREAM.
    MOCK_CART_STREAM.close();
    super.dispose();
  }

  void onTabChange(int index, BuildContext context) {
    currentIndex = index;
    notifyListeners();
    //show search
    if (index == 1) {
      SearchBottomSheet.open(context, []);
    }
    //show wishlist
    if (index == 2) {
      WishListPage.open(context, []);
    }
    //show cart bottom sheet
    if (index == 3) {
      CartPage.open(context);
    }
  }

  void logout() async {
    //await firebaseAuthService.logOut();
    navigationService.pushNamed(Routes.BagUpload);
  }
}
