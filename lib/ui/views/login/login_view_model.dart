import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final snackBarService = locator<SnackBarService>();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigatorService = locator<NavigationService>();
  final sharedPrefService = locator<SharedPreferenceService>();

  bool isObscure = true;
  bool isEmailValid = false;
  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  FocusNode emailFocusNode = FocusNode();
  late FocusNode passFocusNode = FocusNode();

  void init() async {
    await checkLoginData();
  }

  checkLoginData() async {
    if (await sharedPrefService.checkSavedLoginDetails()) {
      navigatorService.pushReplacementNamed(Routes.MainScreen);
    }
  }

  Future loginNow({required String email, required String password}) async {
    setBusy(true);

    if (isEmailEmpty) {
      snackBarService.showSnackBar('Email is empty');
    } else if (isEmailValid == false) {
      emailFocusNode.requestFocus();
      snackBarService.showSnackBar('Email is invalid');
      // emailController.
    } else if (isPasswordEmpty) {
      snackBarService.showSnackBar('Password is empty');
    } else if (passwordController.text.length < 8) {
      snackBarService.showSnackBar('Password must be at least 8 characters');
    } else {
      final response = await firebaseAuthService.loginWithEmail(
          email: email, password: password);
      if (response.success) {
        navigatorService.pushReplacementNamed(Routes.MainScreen);
        snackBarService.showSnackBar('Successful login');
      } else
        snackBarService.showSnackBar(response.errorMessage!);
    }

    setBusy(false);
  }

  Future loginWithGoogle() async {
    setBusy(true);
    final response =
        await firebaseAuthService.loginWithGoogle()!.catchError((onError) {
      print(onError);
    });
    if (response.success) {
      navigatorService.pushReplacementNamed(Routes.MainScreen);
    } else
      snackBarService.showSnackBar(response.errorMessage!);
    setBusy(false);
  }

  Future loginWithFacebook() async {
    setBusy(true);
    final response =
    await firebaseAuthService.loginWithFacebook()!.catchError((onError) {
      print(onError);
    });
    if (response.success) {
      navigatorService.pushReplacementNamed(Routes.MainScreen);
    } else
      snackBarService.showSnackBar(response.errorMessage!);
    setBusy(false);
  }

  void showPassword() {
    setBusy(true);
    if (!isPasswordEmpty) isObscure = !isObscure;
    setBusy(false);
  }

  checkEmail() {
    emailController.text != '' ? isEmailEmpty = false : isEmailEmpty = true;
    //regex to verify if email is valid
    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (regExp.hasMatch(emailController.text)) {
      isEmailValid = true;
    } else {
      isEmailValid = false;
    }

    notifyListeners();
  }

  checkPass() {
    passwordController.text != ''
        ? isPasswordEmpty = false
        : isPasswordEmpty = true;
    notifyListeners();
  }

  void onRegisterTap() {
    navigatorService.pushNamed(Routes.Register);
  }
}
