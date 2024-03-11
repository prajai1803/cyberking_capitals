import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CommonAlerts {
  static Future showLoadingDialog({String? message}) {
    return Get.defaultDialog(
        backgroundColor: Colors.white,
        title: '',
        content: const Column(
          children: [
            SpinKitThreeInOut(
              color: AppColors.secondary,
            ),
            Text(
              "Please wait...",
            )
          ],
        ));
  }

  static showErrorSnack({String? message}) {
    return Get.showSnackbar(GetSnackBar(
      message: message ?? "Something went wrong",
      isDismissible: true,
      duration: const Duration(seconds: 1),
      dismissDirection: DismissDirection.horizontal,
      leftBarIndicatorColor: Colors.red,
      shouldIconPulse: true,
      snackPosition: SnackPosition.values[0],
      snackStyle: SnackStyle.FLOATING,
      animationDuration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(top: 20),
      barBlur: 10,
    ));
  }
}
