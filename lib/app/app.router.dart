// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/bag.dart';
import '../ui/views/bag_item_details/bag_item_details_page.dart';
import '../ui/views/home/home_screen.dart';
import '../ui/views/main/main_screen_view.dart';

class Routes {
  static const String mainScreen = '/';
  static const String MainPage = '/home-screen';
  static const String BagItemDetailsPage = '/bag-item-details-page';
  static const all = <String>{
    mainScreen,
    MainPage,
    BagItemDetailsPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainScreen, page: MainScreen),
    RouteDef(Routes.MainPage, page: HomeScreen),
    RouteDef(Routes.BagItemDetailsPage, page: BagItemDetailsPage),
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
        transitionsBuilder: TransitionsBuilders.slideLeft,
        transitionDuration: const Duration(milliseconds: 200),
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
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
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
