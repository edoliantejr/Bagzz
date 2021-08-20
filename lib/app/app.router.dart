// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/home/home_screen.dart';
import '../ui/views/main/main_screen.dart';

class Routes {
  static const String mainScreen = '/';
  static const String MainPage = '/home-screen';
  static const all = <String>{
    mainScreen,
    MainPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainScreen, page: MainScreen),
    RouteDef(Routes.MainPage, page: HomeScreen),
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
  };
}
