// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import '../models/bag.dart';
import '../ui/views/bag_item_details/bag_item_details_page.dart';
import '../ui/views/cart/cart_screen.dart';
import '../ui/views/home/home_screen.dart';
import '../ui/views/main/main_screen.dart';

class Routes {
  static const String mainScreen = '/';
  static const String MainPage = '/home-screen';
  static const String BagItemDetailsPage = '/bag-item-details-page';
  static const String CartPage = '/cart-page';
  static const all = <String>{
    mainScreen,
    MainPage,
    BagItemDetailsPage,
    CartPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainScreen, page: MainScreen),
    RouteDef(Routes.MainPage, page: HomeScreen),
    RouteDef(Routes.BagItemDetailsPage, page: BagItemDetailsPage),
    RouteDef(Routes.CartPage, page: CartPage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    BagItemDetailsPage: (data) {
      var args = data.getArgs<BagItemDetailsPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BagItemDetailsPage(
          key: args.key,
          bag: args.bag,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
        transitionDuration: const Duration(milliseconds: 800),
      );
    },
    CartPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CartPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideTop,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BagItemDetailsPage arguments holder class
class BagItemDetailsPageArguments {
  final Key? key;
  final Bag bag;
  BagItemDetailsPageArguments({this.key, required this.bag});
}
