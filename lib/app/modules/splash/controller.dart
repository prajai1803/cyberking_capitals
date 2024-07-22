import 'dart:async';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/session_db.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/under_maintenance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashController extends GetxController {
  double logoOpacity = 0;
  late final Timer _timer;

  final SessionDB sessionDB = SessionDB();
  final FirebaseRemoteConfig _config = FirebaseRemoteConfig.instance;

  @override
  void onReady() {
    _startAnimation();
    super.onReady();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _checkAuthAndMaintenance() async {
    final bool? isOnBoardingComplete = await sessionDB.getOnBoardingComplete();
    final String? isAuth = await sessionDB.getRefreshToken();
    final isUnderMaintenance = _config.getBool("isUnderMaintenance");
    final isUnderMaintenanceMsg = _config.getString("isUnderMaintenanceMsg");
    if (isUnderMaintenance) {
      Get.to(() => AppUnderMaintenance(msg: isUnderMaintenanceMsg));
      return;
    }
    UserModel userModel = await StorageProvider().readUserModel();
    if (isAuth == null || JwtDecoder.isExpired(isAuth)) {
      Get.offAndToNamed(AppRoute.loginScreen);
    } else {
      if (userModel.emailVerified == 1 || userModel.phoneNumberVerified == 1) {
        if (isOnBoardingComplete ?? false) {
          Get.offAllNamed(AppRoute.appBase);
        } else {
          Get.offAllNamed(AppRoute.onBoarding);
        }
      } else {
        Get.offAndToNamed(AppRoute.loginScreen);
        // Get.toNamed(AppRoute.emailVerify, arguments: userModel.email);
      }
    }
  }

  void _startAnimation() {
    logoOpacity = 1;
    update();
    _timer =
        Timer(const Duration(seconds: 2), () => _checkAuthAndMaintenance());
  }
}
