import 'dart:io';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/firebase_cloud_storage/cloud_storage_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/utility/image_selector.dart';
import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';
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
  XFile? selectedImage;

  final imageSelector = locator<ImageSelector>();
  final cloudStorageService = locator<CloudStorageService>();
  final apiService = locator<ApiService>();
  final snackBarService = locator<SnackBarService>();

  Future selectImage() async {
    setBusy(true);
    final tempImage = await imageSelector.selectImage();
    if (tempImage != null) {
      selectedImage = await tempImage;
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
    if (selectedImage != null) {
      cloudStorageResult = await cloudStorageService.uploadImage(
          imageToUpload: File(selectedImage!.path),
          title: basename(File(selectedImage!.path).path));
      snackBarService.showSnackBar('Image Uploaded');

      if (cloudStorageResult.isUploaded == true) {
        await apiService.publishBag(
          Bag(
            id: prodName.text +
                DateTime.now().millisecondsSinceEpoch.toString(),
            image: cloudStorageResult.imageUrl,
            name: prodName.text,
            price: double.tryParse(price.text)!,
            category: category.text,
            style: style.text,
            desc: desc.text,
            shipInfo: shipInfo.text,
            payInfo: payInfo.text,
          ),
        );
      }
      snackBarService.showSnackBar('Bag Published');
      clearTextController();
      setBusy(false);
    }
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
}
