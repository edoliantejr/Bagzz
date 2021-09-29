import 'dart:io';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/firebase_cloud_storage/cloud_storage_service.dart';
import 'package:bagzz/core/service/firebase_messaging/firebase_messaging_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/utility/image_selector.dart';
import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';

class BagUploadViewModel extends BaseViewModel {
  final prodName = TextEditingController();
  final brand = TextEditingController();
  final category = TextEditingController();
  final style = TextEditingController();
  final price = TextEditingController();
  final stock = TextEditingController();
  final desc = TextEditingController();
  final shipInfo = TextEditingController();
  final payInfo = TextEditingController();

  final prodNameFocus = FocusNode();
  final brandFocus = FocusNode();
  final categoryFocus = FocusNode();
  final styleFocus = FocusNode();
  final priceFocus = FocusNode();
  final stockFocus = FocusNode();
  final descFocus = FocusNode();
  final shipInfoFocus = FocusNode();
  final payInfoFocus = FocusNode();

  XFile? selectedImage;

  final imageSelector = locator<ImageSelector>();
  final cloudStorageService = locator<CloudStorageService>();
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();
  final snackBarService = locator<SnackBarService>();
  final navigatorService = locator<NavigationService>();
  final firebaseMessagingService = locator<FirebaseMessagingService>();

  Future selectImage() async {
    setBusy(true);
    final tempImage = await imageSelector.selectImage();
    if (tempImage != null) {
      selectedImage = tempImage;
      setBusy(false);
    }
  }

  void clearImageSelection() {
    selectedImage = null;
    notifyListeners();
  }

  Future publishBag() async {
    var cloudStorageResult;
    setBusy(true);
    if (isAllRequiredValid()) {
      dialogService.showLoadingDialog(message: 'Please wait...', willPop: true);
      if (selectedImage != null) {
        cloudStorageResult = await cloudStorageService.uploadImage(
            imageToUpload: File(selectedImage!.path),
            title: basename(File(selectedImage!.path).path));
        if (cloudStorageResult.isUploaded == true) {
          await apiService.publishBag(
            Bag(
              image: cloudStorageResult.imageUrl,
              name: prodName.text,
              price: double.tryParse(price.text)!,
              stock: int.parse(stock.text),
              category: category.text,
              style: style.text,
              desc: desc.text,
              shipInfo: shipInfo.text,
              payInfo: payInfo.text,
              isLatest: true,
            ),
          );
          clearTextController();
          Get.back(canPop: false);
          navigatorService.pop();
          snackBarService.showSnackBar('Bag was published.');
          firebaseMessagingService.sendTopicNotification(
              toTopic: '/topics/BAG_TOPIC',
              title: 'New Published Bag',
              message: 'Check it out');
        }

        notifyListeners();
      }
    }

    setBusy(false);
  }

  bool isAllRequiredValid() {
    bool isValid = false;
    if (selectedImage == null) {
      snackBarService.showSnackBar('Should have a product image',
          isError: true);
    } else if (prodName.text.isEmpty) {
      snackBarService.showSnackBar('Should have a product name', isError: true);
      prodNameFocus.requestFocus();
    } else if (brand.text.isEmpty) {
      snackBarService.showSnackBar('Should have a product brand',
          isError: true);
      brandFocus.requestFocus();
    } else if (category.text.isEmpty) {
      snackBarService.showSnackBar('Should have a product category',
          isError: true);
      categoryFocus.requestFocus();
    } else if (style.text.isEmpty) {
      snackBarService.showSnackBar('Should have a product style',
          isError: true);
      styleFocus.requestFocus();
    } else if (price.text.isEmpty && !price.text.isNum) {
      snackBarService.showSnackBar('Should have a product price',
          isError: true);
      priceFocus.requestFocus();
    } else if (stock.text.isEmpty && !stock.text.isNum) {
      snackBarService.showSnackBar('Product stocks should be indicated ',
          isError: true);
      stockFocus.requestFocus();
    } else if (desc.text.isEmpty) {
      snackBarService.showSnackBar('Should have a product description ',
          isError: true);
      descFocus.requestFocus();
    } else if (shipInfo.text.isEmpty) {
      snackBarService.showSnackBar('Should have a Product Shipping info ',
          isError: true);
      shipInfoFocus.requestFocus();
    } else if (payInfo.text.isEmpty) {
      snackBarService.showSnackBar('Should have a product payment info ',
          isError: true);
      payInfoFocus.requestFocus();
    } else {
      isValid = true;
    }

    return isValid;
  }

  void clearTextController() {
    prodName.clear();
    brand.clear();
    category.clear();
    style.clear();
    price.clear();
    stock.clear();
    desc.clear();
    shipInfo.clear();
    payInfo.clear();
    selectedImage = null;
  }

  void goToChooseCategory() async {
    final selectedCategory =
        await navigatorService.pushNamed(Routes.ChooseCategoryPage);
    if (selectedCategory != null) {
      category.text = selectedCategory;
    }
  }
}
