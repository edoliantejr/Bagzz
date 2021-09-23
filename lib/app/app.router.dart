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
import '../ui/views/cart/cart_page_view.dart';
import '../ui/views/choose_category/choose_category_page.dart';
import '../ui/views/home/home_screen.dart';
import '../ui/views/login/login.dart';
import '../ui/views/main/main_screen_view.dart';
import '../ui/views/publish_bag/bag_upload.dart';
import '../ui/views/register/register_view.dart';

class Routes {
  static const String LogIn = '/';
  static const String MainScreen = '/main-screen';
  static const String HomeScreen = '/home-screen';
  static const String BagItemDetailsPage = '/bag-item-details-page';
  static const String CartPage = '/cart-page';
  static const String BagUpload = '/bag-upload';
  static const String ChooseCategory = '/choose-category';
  static const String Register = '/Register';
  static const all = <String>{
    LogIn,
    MainScreen,
    HomeScreen,
    BagItemDetailsPage,
    CartPage,
    BagUpload,
    ChooseCategory,
    Register,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.LogIn, page: Login),
    RouteDef(Routes.MainScreen, page: MainScreen),
    RouteDef(Routes.HomeScreen, page: HomeScreen),
    RouteDef(Routes.BagItemDetailsPage, page: BagItemDetailsPage),
    RouteDef(Routes.CartPage, page: CartPage),
    RouteDef(Routes.BagUpload, page: BagUpload),
    RouteDef(Routes.ChooseCategory, page: ChooseCategory),
    RouteDef(Routes.Register, page: Register),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Login(),
        settings: data,
      );
    },
    MainScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    HomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    BagItemDetailsPage: (data) {
      var args = data.getArgs<BagItemDetailsPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BagItemDetailsPage(
          bag: args.bag,
          key: args.key,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
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
    BagUpload: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const BagUpload(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    ChooseCategory: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ChooseCategory(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    Register: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Register(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
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
  final Bag bag;
  final Key? key;
  BagItemDetailsPageArguments({required this.bag, this.key});
}
