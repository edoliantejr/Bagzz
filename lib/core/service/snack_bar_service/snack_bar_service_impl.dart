import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'snack_bar_service.dart';

class SnackBarServiceImpl extends SnackBarService {
  @override
  Future<dynamic>? showSnackBar(String message, {TextButton? mainButton}) {
    return GetBar(
        message: message,
        duration: Duration(seconds: 2, milliseconds: 500),
        margin: EdgeInsets.all(20),
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(milliseconds: 500),
        borderRadius: 12,
        mainButton: mainButton)
        .show();
  }
}
