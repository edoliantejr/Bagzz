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
import '../ui/views/pre_loader_screen/pre_loader_screen.dart';
import '../ui/views/publish_bag/bag_upload.dart';
import '../ui/views/register/register_view.dart';

class Routes {
  static const String PreLoaderScreen = '/';
  static const String LogIn = '/Login';
  static const String MainScreen = '/main-screen';
  static const String HomeScreen = '/home-screen';
  static const String BagItemDetailsPage = '/bag-item-details-page';
  static const String CartPage = '/cart-page';
  static const String BagUpload = '/bag-upload';
  static const String ChooseCategoryPage = '/choose-category-page';
  static const String Register = '/Register';
  static const all = <String>{
    PreLoaderScreen,
    LogIn,
    MainScreen,
    HomeScreen,
    BagItemDetailsPage,
    CartPage,
    BagUpload,
    ChooseCategoryPage,
    Register,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.PreLoaderScreen, page: PreLoaderScreen),
    RouteDef(Routes.LogIn, page: Login),
    RouteDef(Routes.MainScreen, page: MainScreen),
    RouteDef(Routes.HomeScreen, page: HomeScreen),
    RouteDef(Routes.BagItemDetailsPage, page: BagItemDetailsPage),
    RouteDef(Routes.CartPage, page: CartPage),
    RouteDef(Routes.BagUpload, page: BagUpload),
    RouteDef(Routes.ChooseCategoryPage, page: ChooseCategoryPage),
    RouteDef(Routes.Register, page: Register),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    PreLoaderScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreLoaderScreen(),
        settings: data,
      );
    },
    Login: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const Login(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
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
    ChooseCategoryPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ChooseCategoryPage(),
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
