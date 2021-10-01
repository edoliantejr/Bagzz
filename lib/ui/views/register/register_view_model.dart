import 'dart:io';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/firebase_cloud_storage/cloud_storage_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/utility/image_selector.dart';
import 'package:bagzz/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordControllers = TextEditingController();
  final snackBarService = locator<SnackBarService>();
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final style = TextEditingController();

  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final passFocus = FocusNode();
  final categoryFocus = FocusNode();

  bool isObscure = true;
  bool isObscures = true;
  bool isEmailEmpty = true;
  bool isNameEmpty = true;
  bool isPasswordEmpty = true;
  bool isPasswordsEmpty = true;

  XFile? selectedImage;

  final imageSelector = locator<ImageSelector>();
  final cloudStorageService = locator<CloudStorageService>();
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();
  Future selectImage() async {
    setBusy(true);
    final tempImage = await imageSelector.selectImage();
    if (tempImage != null) {
      selectedImage =  tempImage;
      setBusy(false);
    }
  }

  void clearImageSelection() {
    selectedImage = null;
    notifyListeners();
  }



  Future registerNow() async {
    setBusy(true);
    var cloudStorageResult;
    if (isAllRequiredValid()) {
      dialogService.showLoadingDialog(message: 'Please wait...', willPop: true);
      if (selectedImage != null) {
        cloudStorageResult = await cloudStorageService.uploadImage(
            imageToUpload: File(selectedImage!.path),
            title: (File(selectedImage!.path).path));
        if (cloudStorageResult.isUploaded == true) {
          await firebaseAuthService.signUpWithEmail(
           email: email.text,
            password: password.text,
            name: name.text,
            image: cloudStorageResult.imageUrl,

          );
          clearTextController();
          Get.back(canPop: false);
          navigationService.pop();
          snackBarService.showSnackBar('Account Registered.');
        }

        notifyListeners();
      }
    }

    setBusy(false);
  }


  bool isAllRequiredValid() {
    bool isValid = false;
    if (selectedImage == null) {
      snackBarService.showSnackBar('Should have an image',
          isError: true);
    } else if (name.text.isEmpty) {
      snackBarService.showSnackBar('Name is empty', isError: true);
      nameFocus.requestFocus();
    } else if (email.text.isEmpty) {
      snackBarService.showSnackBar('Email is empty', isError: true);
      emailFocus.requestFocus();
    } else if (password.text.isEmpty) {
      snackBarService.showSnackBar('Password is empty',
          isError: true);
      passFocus.requestFocus();
    } else {
      isValid = true;
    }

    return isValid;
  }

  void clearTextController() {
    email.clear();
    name.clear();
    password.clear();
    selectedImage = null;
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


}

