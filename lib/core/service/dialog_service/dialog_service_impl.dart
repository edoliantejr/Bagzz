import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogServiceImpl extends DialogService {
  @override
  Future showDialog(String message) {
    // TODO: implement showDialog
    throw UnimplementedError();
  }

  @override
  Future showLoadingDialog(String message) {
    return Get.defaultDialog(
        title: message,
        content: Center(
          child: Container(
            height: 50,
            width: 50,
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }
}
