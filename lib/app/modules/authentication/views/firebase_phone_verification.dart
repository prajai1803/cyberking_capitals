import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/authentication/controller.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirebaseVerifyScreen extends StatefulWidget {
  const FirebaseVerifyScreen({super.key});

  @override
  State<FirebaseVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<FirebaseVerifyScreen> {
  final _controller = Get.find<AuthController>();

  @override
  void initState() {
    _checkSentEmail();
    _controller.startEmailVerificationTimer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.otpTextEditingController.clear();
    _controller.resetTimer();
    super.dispose();
  }

  _checkSentEmail() async {
    String? email = Get.arguments as String;
    _controller.emailTextEditingController.text = email;
    // _controller.emailVerifyWithOTP();
    _controller.verifyPhoneAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.r,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: _controller.verificationFormKey,
            child: Column(
              children: [
                SizedBox(height: 28.h),
                Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 23.h,
                    color: AppColors.textBlack,
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  height: 150.r,
                  width: 150.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xeFF1F5FF),
                  ),
                  child: Image.asset(AppImages.happyBoy),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Enter the verification code we\njust sent you on your \nphone number.",
                  style: TextStyle(
                    fontSize: 15.h,
                    height: 1.5,
                    color: AppColors.textBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.h, horizontal: 105.w),
                    child: TextFormField(
                      controller: _controller.otpTextEditingController,
                      // keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return "OTP can't be empty";
                        }
                        if (value.length != 6) {
                          return "OTP should be 6 digit";
                        }
                        return null;
                      },
                      maxLength: 6,
                      style: TextStyle(
                        fontSize: 24.h,
                        color: AppColors.textBlack,
                      ),
                      textAlign: TextAlign.center,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GetBuilder(
                    init: _controller,
                    initState: (_) {},
                    id: "Email Verification Button",
                    builder: (_) {
                      return AppElevatedButton(
                        text: "Verify OTP",
                        isLoading: _controller.isEmailVerificationLoading,
                        onPressed: () {
                          if (!_controller.isEmailVerificationLoading) {
                            // _controller.emailVerifyWithOTP();
                            _controller.verifyPhoneNumberOTP();
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 14.h),
                GetBuilder(
                  init: _controller,
                  initState: (_) {},
                  id: "Resend Otp",
                  builder: (_) {
                    return _controller.timerCount != 0
                        ? Text(
                            "Resend in ${_controller.timerCount}s",
                            style: TextStyle(
                              fontSize: 11.h,
                              height: 1.5,
                              color: AppColors.textBlack2,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : TextButton(
                            onPressed: () {
                              _controller.resetTimer();
                              _controller.startEmailVerificationTimer();
                              // _controller.sendEmailToVerify();
                              _controller.verifyPhoneAuth();
                            },
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(
                                  fontSize: 12.h, fontWeight: FontWeight.w500),
                            ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
