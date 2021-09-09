
import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel {
  int numCartItems = 0;
  int currentIndex = 0;
  ScrollController scrollController = new ScrollController();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  final name = 'Test101';
  final email = 'blendit.com';
  final urlImage = 'assets/icons/drawer.svg';

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



}}
