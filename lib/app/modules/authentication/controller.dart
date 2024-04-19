import 'dart:async';

import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/firebase_provider.dart';
import 'package:cyberking_capitals/app/data/providers/session_db.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/authentication/repository.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final verificationFormKey = GlobalKey<FormState>();
  final fogetPasswordverificationFormKey = GlobalKey<FormState>();
  final fogetPasswordFormKey = GlobalKey<FormState>();

  final SessionDB _sessionDB = SessionDB();

  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();
  final otpTextEditingController = TextEditingController();
  final newPasswordTextEditingController = TextEditingController();

  late final AuthRepositry _authRepositry;

  Timer? _timer;
  int timerCount = 30;

  bool isLoading = false;
  bool isTimerLoading = false;

  @override
  void onInit() {
    _authRepositry = AuthRepositry(
        firebaseProvider: FirebaseProvider(), apiProvider: ApiProvider());
    super.onInit();
  }

  void clearTextEditingController() {
    nameTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    confirmPasswordTextEditingController.clear();
  }

  void navigateToEmailVerification() {
    Get.toNamed(AppRoute.emailVerify);
    startEmailVerificationTimer();
  }

  void startEmailVerificationTimer() {
    if (_timer?.isActive == true) {
      _timer!.cancel();
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCount != 0) {
        timerCount--;
        update(["Resend Otp"]);
      } else {
        _timer!.cancel();
      }
    });
  }

  void resetTimer() {
    timerCount = 30;
  }

  Future<bool> sendEmailToVerify() async {
    try {
      final status = await _authRepositry
          .generateOTP(emailTextEditingController.text.trim());
      if (status) {
        if (status) {
          CommonAlerts.showSuccessSnack(
              message: "OTP sent to the ${emailTextEditingController.text}");
          return true;
        }
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> sendEmailForForgetPassword() async {
    try {
      final status = await _authRepositry
          .forgetPasswordGenerateOTP(emailTextEditingController.text.trim());
      if (status) {
        if (status) {
          isLoading = false;
          CommonAlerts.showSuccessSnack(
              message: "OTP sent to the ${emailTextEditingController.text}");
          return true;
        }
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> forgetPasswordVerify() async {
    try {
      isLoading = true;
      update(["Verify Forget Password"]);
      if (verificationFormKey.currentState!.validate()) {
        final status = await _authRepositry.forgetPasswordVerifyOTP(
          emailTextEditingController.text.trim(),
          otpTextEditingController.text,
          newPasswordTextEditingController.text.trim(),
        );

        if (status) {
          if (status) {
            Get.back();
            Get.back();
            newPasswordTextEditingController.clear();
            otpTextEditingController.clear();
            CommonAlerts.showSuccessSnack(
                message: "Password has been changed, try to login");
            isLoading = false;
            update(["Verify Forget Password"]);
            return true;
          }
        }
        isLoading = false;
        update(["Verify Forget Password"]);
      }
    } on ApiStatusException catch (e) {
      isLoading = false;
      update(["Verify Forget Password"]);
      CommonAlerts.showErrorSnack(message: e.message);
      return false;
    }
    return false;
  }

  Future<bool> emailVerifyWithOTP() async {
    if (verificationFormKey.currentState!.validate()) {
      try {
        isLoading = true;
        update(["Email Verification Button"]);
        final status = await _authRepositry.verifyOTP(
            emailTextEditingController.text.trim(),
            otpTextEditingController.text.trim());
        isLoading = false;
        update(["Email Verification Button"]);
        if (status) {
          if (status) {
            final onBoardingStatus = await _sessionDB.getOnBoardingComplete();
            if (onBoardingStatus != null) {
              if (onBoardingStatus == true) {
                Get.offAllNamed(AppRoute.appBase);
              } else {
                Get.offAllNamed(AppRoute.onBoarding);
              }
            } else {
              Get.offAllNamed(AppRoute.onBoarding);
            }
            isLoading = false;
            update(["Email Verification Button"]);
            CommonAlerts.showSuccessSnack(message: "OTP has been verified");
            return true;
          }
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  void signUp() async {
    if (signUpFormKey.currentState!.validate()) {
      try {
        isLoading = true;
        update(["Sign Up"]);
        if (emailTextEditingController.text.startsWith(RegExp(r'^\d'))) {
          await _signUpWithPhoneNumber();
        } else {
          await _signUpWithEmail();
        }
        isLoading = false;
        update(["Sign Up"]);
      } on ApiStatusException catch (e) {
        isLoading = false;
        update(["Sign Up"]);
        CommonAlerts.showErrorSnack(message: e.message);
      }
    }
  }

  Future<void> _signUpWithPhoneNumber() async {
    final userCreated = await _authRepositry.signUp(
        null,
        emailTextEditingController.text.trim(),
        passwordTextEditingController.text.trim(),
        nameTextEditingController.text);
    if (userCreated) {
      CommonAlerts.showSuccessSnack(message: "User created successfully");
      update();
      login();
      isLoading = false;
    } else {
      // login();
      // login();
      update();
    }
  }

  Future<void> _signUpWithEmail() async {
    final userCreated = await _authRepositry.signUp(
        emailTextEditingController.text.trim(),
        null,
        passwordTextEditingController.text.trim(),
        nameTextEditingController.text);
    if (userCreated) {
      update();
      login();
      isLoading = false;
    } else {
      // login();
      // login();
      update();
    }
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading = true;
      update(["Login Button"]);
      try {
        if (emailTextEditingController.text.startsWith(RegExp(r'^\d'))) {
          final res = await _authRepositry.loginWithEmailorPhoneNumber(
            null,
            emailTextEditingController.text,
            passwordTextEditingController.text,
          );

          if (res != null) {
            _saveTokens(res);
            await _fetchProfile();
          }
        } else {
          final res = await _authRepositry.loginWithEmailorPhoneNumber(
            emailTextEditingController.text,
            null,
            passwordTextEditingController.text,
          );
          if (res != null) {
            _saveTokens(res);
            await _fetchProfile();
          }
        }
        isLoading = false;
        update(["Login Button"]);
      } on ApiStatusException catch (e) {
        CommonAlerts.showErrorSnack(message: e.message);
        isLoading = false;
        update(["Login Button"]);
      }
    }
  }

  Future<void> _fetchProfile() async {
    final user = await _authRepositry.getProfile();

    if (user != null) {
      StorageProvider().writeUserModel(user);
      isLoading = false;
      if (user.emailVerified == 0) {
        sendEmailToVerify();
        Get.toNamed(AppRoute.emailVerify);
      } else {
        final onBoardingStatus = await _sessionDB.getOnBoardingComplete();
        if (onBoardingStatus ?? false) {
          Get.offAllNamed(AppRoute.appBase);
        }
        Get.offAllNamed(AppRoute.onBoarding);
      }
      isLoading = false;
      update(["Login Button"]);
    } else {
      isLoading = false;
      update(["Login Button"]);
      CommonAlerts.showErrorSnack();
    }
  }

  void _saveTokens(Map<String, dynamic> res) {
    if (res["access_token"] != null || res["access_token"] != "") {
      _sessionDB.setAccessToken(res["access_token"]);
    }
    if (res["refresh_token"] != null || res["refresh_token"] != "") {
      _sessionDB.setRefreshToken(res["access_token"]);
    }
  }

  void updatePasswordVisiblity() {
    isPasswordVisible = !isPasswordVisible;
    update(["password"]);
  }

  void updateConfirmPasswordVisiblity() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update(["password2"]);
  }
}
