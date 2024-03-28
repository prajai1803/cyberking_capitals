import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReferController extends GetxController {
  void copyRefferralCode() async {
    try {
      await Clipboard.setData(const ClipboardData(text: "Krutikasingh1008"));
      CommonAlerts.showSuccessSnack(message: "Successfully code copied");
    } catch (e) {
      CommonAlerts.showSuccessSnack(message: "Failed to copy");
    }
  }
}
