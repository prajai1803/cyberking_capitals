import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/authentication/controller.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:cyberking_capitals/app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordVerifyScreen extends StatefulWidget {
  const PasswordVerifyScreen({super.key});

  @override
  State<PasswordVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<PasswordVerifyScreen> {
  final _controller = Get.find<AuthController>();

  @override
  void initState() {
    _controller.startEmailVerificationTimer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.otpTextEditingController.clear();
    _controller.resetTimer();
    super.dispose();
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
                  "Enter the verification code we\njust sent you on your email\n address.",
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return "OTP can't be empty";
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
                    padding:
                        EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                    child: AppTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return "value can't be empty";
                        }
                        return null;
                      },
                      controller: _controller.newPasswordTextEditingController,
                      hint: "Enter New password",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GetBuilder(
                    init: _controller,
                    initState: (_) {},
                    id: "Verify Forget Password",
                    builder: (_) {
                      return AppElevatedButton(
                        isLoading: _controller.isLoading,
                        text: "Verify & Change Password",
                        onPressed: () {
                          _controller.forgetPasswordVerify();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 14.h),
                GetBuilder(
                  init: _controller,
                  initState: (_) {},
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
                              _controller.sendEmailForForgetPassword();
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
