import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel {
  int numCartItems = 0;
  int currentIndex = 0;
  ScrollController scrollController = new ScrollController();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  final apiService = locator<ApiService>();
  final name = 'Test101';
  final email = 'blendit.com';
  final urlImage = 'assets/icons/drawer.svg';
  User? user;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  init() async {
    setBusy(true);
    await getUserDetails();
    setBusy(false);
  }

  Future<void> getUserDetails() async {
    user = await apiService.getCurrentUser();
  }

  void goToPublishBag() {
    navigationService.pop();
    navigationService.pushNamed(Routes.BagUpload, arguments: []);
  }

  void logout() async{
    await  firebaseAuthService.logOut();
    navigationService.pushNamed(Routes.LogIn);
  }
}
