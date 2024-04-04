import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late final QRViewController? qrController;

  void flipCamera() async {
    if (qrController != null) {
      await qrController!.flipCamera();
    }
  }
}
