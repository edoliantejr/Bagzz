import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/category.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  //list for storing liked bags
  final List<int> likedBags = [];

  //init controller
  final PageController controller =
      PageController(initialPage: 0, keepPage: true);

  List<Category> categlist = [];

  List<Bag> bagsList = [];

  void init() {
    loadCategoryData();
    loadBagsData();
  }

//override dispose class to also dispose the controller to avoid memory leakage
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void loadCategoryData() async {
    setBusy(true);
    final List<Category> likeBagsData = [
      Category(
          id: 1,
          image: 'assets/images/model1.png',
          categoryTitle: 'Handle Bags'),
      Category(
          id: 2,
          image: 'assets/images/model2.png',
          categoryTitle: 'Crossbody Bags'),
      Category(
          id: 3,
          image: 'assets/images/model3.png',
          categoryTitle: 'Shoulder Bags'),
      Category(
          id: 4, image: 'assets/images/model4.png', categoryTitle: 'Tote Bags'),
    ];
    categlist.addAll(likeBagsData);
    await Future.delayed(Duration(seconds: 5));
    setBusy(false);
  }

  void loadBagsData() async {
    final List<Bag> bags = [
      Bag(
        id: 2,
        image: 'assets/images/bag-header-01.jpg',
        title: "This season's latest",
        name: "Artsy",
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
        id: 1,
        image: 'assets/images/bag-header-02.jpg',
        title: "This season's latest",
        name: "Artsy",
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
    bagsList.addAll(bags);
  }
}
