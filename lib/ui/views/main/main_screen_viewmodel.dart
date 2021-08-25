
import 'package:bagzz/core/service/api/mock_data.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/views/cart/cart_page_view.dart';
import 'package:bagzz/ui/views/search/search_view.dart';
import 'package:bagzz/ui/views/wishlist/wishlist_view.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class MainScreenViewModel extends BaseViewModel {
  final List<Bag> bagsList = [];
  ScrollController scrollController = new ScrollController();

  init() {
    loadCartData();
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
    if (index == 1) {
      SearchBottomSheet.open(context, bagsList);
    }
    if (index == 2) {
      WishListPage.open(context,bagsList);
    }
    //show cart bottom sheet
    if (index == 3) {
      CartPage.open(context);
    }
    notifyListeners();
  }

  //for demo , load cart and wishlist containing list of bags
  void loadCartData() {
    final List<Bag> bags = [
      Bag(
        id: 1,
        image: 'assets/images/bag02.png',
        title: " This season's best buy",
        name: "Artsy",
        price: 564,
        category: 'Wallet with chain',
        style: 'Style #36252 0YK0G 1000',
        desc: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        shipInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        payInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
      ),
      Bag(
        id: 2,
        image: 'assets/images/bag03.png',
        title: " This season's popular",
        name: "Berkely",
        price: 1364,
        category: 'Wallet with chain',
        style: 'Style #36252 0YK0G 1000',
        desc: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        shipInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        payInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
      ),
      Bag(
        id: 3,
        image: 'assets/images/bag04.png',
        title: " This season's latest",
        name: "Capucinos",
        price: 899,
        category: 'Wallet with chain',
        style: 'Style #36252 0YK0G 1000',
        desc: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        shipInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        payInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
      ),
      Bag(
        id: 4,
        image: 'assets/images/bag05.png',
        title: " This season's latest",
        name: "Monogram",
        price: 2999,
        category: 'Wallet with chain',
        style: 'Style #36252 0YK0G 1000',
        desc: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        shipInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
        payInfo: 'Lorem ipsum dolor sit amet, '
            'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
            'ut labore et dolore magna aliqua.'
            ' Vitae congue mauris rhoncus aenean vel elit. ',
      ),
    ];
    bagsList.addAll(bags);
  }
}
