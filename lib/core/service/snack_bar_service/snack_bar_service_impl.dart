import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'snack_bar_service.dart';

class SnackBarServiceImpl extends SnackBarService {
  @override
  Future<dynamic>? showSnackBar(String message, {TextButton? mainButton}) {
    return GetBar(
            message: message,
            duration: Duration(seconds: 2, milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            snackStyle: SnackStyle.FLOATING,
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 12,
            mainButton: mainButton)
        .show();
  }

  void open() {
    Get.snackbar('title', 'message');
  }
}
