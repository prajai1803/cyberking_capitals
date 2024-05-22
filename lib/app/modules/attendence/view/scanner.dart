import 'package:cyberking_capitals/app/modules/attendence/controller/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../widgets/overlay.dart';

class QRScanner extends StatelessWidget {
  QRScanner({super.key});

  final _controller = Get.put(ScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: MobileScanner(
              controller: _controller.mobileScannerController,
              overlay: QRScannerOverlay(
                overlayColour: Colors.black.withOpacity(.2),
              ),
              onDetect: _onDetect,
            ),
          ),
          Positioned(
            top: 560.h,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.flash_on,
                      size: 32.h,
                      color: Colors.white,
                    )),
                SizedBox(width: 24.w),
                IconButton(
                    onPressed: () {
                      _controller.flipCamera();
                    },
                    icon: Icon(
                      Icons.flip_camera_android,
                      size: 32.h,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) async {
  //   // await controller.resumeCamera();
  //   _controller.qrController = controller;
  //   controller.scannedDataStream.listen((scanData) async {
  //     print("object");
  //     _controller.submitAttendance(scanData.code);
  //     // CommonAlerts.showErrorSnack(message: scanData.code);
  //     Get.back();
  //   });
  // }

  void _onDetect(BarcodeCapture barcode) async {
    _controller.mobileScannerController.stop();
    String? rawData = barcode.barcodes[0].rawValue;

    _controller.submitAttendance(rawData);
    Get.back();
  }
}
