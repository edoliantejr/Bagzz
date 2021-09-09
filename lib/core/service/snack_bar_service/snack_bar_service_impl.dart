import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'snack_bar_service.dart';

class SnackBarServiceImpl extends SnackBarService {
  @override
  Future<dynamic>? showSnackBar(String message,
      {TextButton? mainButton, bool? isError}) {
    return GetBar(
            message: message,
            duration: Duration(seconds: 2, milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            backgroundColor: isError != null && isError
                ? Colors.red[400]!
                : Colors.grey[800]!,
            snackStyle: SnackStyle.FLOATING,
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            animationDuration: Duration(milliseconds: 200),
            borderRadius: 12,
            mainButton: mainButton)
        .show();
  }

  void open() {
    Get.snackbar('title', 'message');
  }
}
