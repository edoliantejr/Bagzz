import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordControllers = TextEditingController();
  final snackBarService = locator<SnackBarService>();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  bool isObscure = true;
  bool isObscures = true;
  bool isEmailValid = false;
  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  bool isPasswordsEmpty = true;
  late FocusNode emailFocusNode;
  late FocusNode passFocusNode;
  late FocusNode passFocusNodes;

  void init() {
    emailFocusNode = FocusNode();
    passFocusNode = FocusNode();
    passFocusNodes = FocusNode();
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
        navigationService.pushNamedAndRemoveUntil(Routes.MainScreen,
            predicate: (route) => false);
        snackBarService.showSnackBar('Successful login');
      } else
        snackBarService.showSnackBar(response.errorMessage!);
    }

    setBusy(false);
  }

  Future signUpNow({required String email, required String password}) async {
    setBusy(true);

    final response = await firebaseAuthService.signUpWithEmail(
        email: email, password: password);
    if (response.success) {
    } else {
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
    if (response.success)
      navigationService.pushReplacementNamed(Routes.MainScreen);
    else
      snackBarService.showSnackBar(response.errorMessage!);
    setBusy(false);
  }

  void showPassword() {
    setBusy(true);
    if (!isPasswordEmpty) isObscure = !isObscure;
    setBusy(false);
  }

  void showPasswords() {
    setBusy(true);
    if (!isPasswordsEmpty) isObscures = !isObscures;
    setBusy(false);
  }


  checkEmail() {
    emailController.text != '' ? isEmailEmpty = false : isEmailEmpty = true;
    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (regExp.hasMatch(emailController.text)) {
      isEmailValid = true;
    } else {
      isEmailValid = false;
    }

    // isEmailValid=true;
    notifyListeners();
  }

  checkPass() {
    passwordController.text != ''
        ? isPasswordEmpty = false
        : isPasswordEmpty = true;
    notifyListeners();
  }
  checkPass2() {
    passwordController.text != ''
        ? isPasswordEmpty = false
        : isPasswordEmpty = true;
    notifyListeners();
  }


  validateEmail() {}

  void logout() async{
    await  firebaseAuthService.logOut();
    navigationService.pushNamed(Routes.LogIn);
  }
}
