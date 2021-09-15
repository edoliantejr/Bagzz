import 'dart:async';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/category.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  final List<Bag> bagBannerList = [];
  List<Category> categoryList = [];
  final apiService = locator<ApiService>();
  StreamSubscription? listOfBagStreamSubscription;

  Future init() async {
    setBusy(true);
    loadBagBannerData();
    loadCategoryData();
    setBusy(false);
  }

  @override
  void dispose() {
    listOfBagStreamSubscription?.cancel();
    super.dispose();
  }

  void loadBagBannerData() {
    final List<Bag> bagBanner = [
      Bag(
        id: ' 1',
        image: 'assets/images/bag-header-01.png',
        title: " This season's best buy",
        name: "Artsy",
        price: 564,
        category: 'Wallet with chain',
        style: 'Style #36252 0YK0G 1000',
        desc:
            "As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain."
            "Material & care"
            """
        All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth""",
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
        id: '2',
        image: 'assets/images/bag-header-02.png',
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
    ];
    bagBannerList.addAll(bagBanner);
  }

  void loadCategoryData() async {
    final List<Category> category = [
      Category(
          id: '1',
          coverImage: 'assets/images/model1.png',
          categoryTitle: 'Handle Bags'),
      Category(
          id: '2',
          coverImage: 'assets/images/model2.png',
          categoryTitle: 'Crossbody Bags'),
      Category(
          id: '3',
          coverImage: 'assets/images/model3.png',
          categoryTitle: 'Shoulder Bags'),
      Category(
          id: '4',
          coverImage: 'assets/images/model4.png',
          categoryTitle: 'Tote Bags'),
    ];
    categoryList.addAll(category);
  }
}
