import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final snackBarService = locator<SnackBarService>();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();

  Future loginNow({required String email, required String password}) async {
    setBusy(true);
    await firebaseAuthService.loginWithEmail(email: email, password: password);
    setBusy(false);
  }

  Future signUpNow({required String email, required String password}) async {
    setBusy(true);
    await firebaseAuthService.signUpWithEmail(email: email, password: password);
    setBusy(false);
  }
}
