import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LBToast {
  static void showToast({
    required String message,
    Toast? toast,
    int timeInsecForIosWeb = 1,
    double? fonsize,
    ToastGravity? gravity = ToastGravity.CENTER,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toast,
        fontSize: fonsize,
        timeInSecForIosWeb: timeInsecForIosWeb,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }

  static void showLoading() {
    EasyLoading.show(
      status: "loading...",
      maskType: EasyLoadingMaskType.clear
      );
  }
}
