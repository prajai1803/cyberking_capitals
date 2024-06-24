import 'package:cyberking_capitals/app/data/models/certificate_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/profile/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileController extends GetxController {
  UserModel? currentUser;
  List<CertificateModel> certificatesList = List.empty(growable: true);

  final StorageProvider _sessionDB = StorageProvider();
  final ProfileRepository _repository =
      ProfileRepository(apiProvider: ApiProvider());

  String? currentVersion;

  @override
  void onInit() async {
    currentUser = await _sessionDB.readUserModel();
    _fetchVersion();

    if (currentUser == null) {
      fetchUserProfile();
    } else {
      update(["Profile Details"]);
    }
    super.onInit();
  }

  void _fetchVersion() async {
    try {
      final versionInfo = await PackageInfo.fromPlatform();
      currentVersion = versionInfo.version;
      update(["Version"]);
    } on PlatformException catch (e) {
      debugPrint(e.code);
    }
  }

  Future<void> fetchUserProfile() async {
    try {
      final UserModel? user = await _repository.getProfile();
      if (user != null) {
        currentUser = user;

        await _sessionDB.writeUserModel(user);
      }
      update(["Profile Details"]);
    } on ApiStatusException catch (e) {
      CommonAlerts.showSuccessSnack(message: e.message);
    } catch (e) {
      CommonAlerts.showSuccessSnack();
    }
  }
}
