import 'package:cyberking_capitals/app/modules/attendence/controller/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
            child: QRView(
              key: _controller.qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                overlayColor: Colors.black.withOpacity(.6),
                borderColor: Colors.white,
                borderRadius: 12,
                borderWidth: 10,
              ),
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

  void _onQRViewCreated(QRViewController controller) {
    _controller.qrController = controller;
    controller.scannedDataStream.listen((scanData) async {
      await _controller.qrController!.stopCamera();
      // CommonAlerts.showErrorSnack(message: scanData.code);
      Get.back();
    });
  }
}
