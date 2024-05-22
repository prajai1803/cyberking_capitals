import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final _repository = HomeRepository(apiProvider: ApiProvider());

  late final MobileScannerController mobileScannerController;

  @override
  void onInit() async {
    mobileScannerController = MobileScannerController();
    super.onInit();
  }

  void flipCamera() async {
    await mobileScannerController.switchCamera();
  }

  Future<bool> submitAttendance(batchId) async {
    int? batchIdValue = int.tryParse(batchId) ?? 0;
    try {
      final sucess = await _repository.submitAttendance(batchIdValue);
      if (sucess) {
        CommonAlerts.showSuccessSnack(message: "Attendance Mark Sucessfully");
        return true;
      }
      return false;
    } on ApiStatusException catch (e) {
      CommonAlerts.showErrorSnack(message: e.message);
      return false;
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
      return false;
    }
  }
}
