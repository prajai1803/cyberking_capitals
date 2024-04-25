import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/authentication/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/utils/validators.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:cyberking_capitals/app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
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
            key: _controller.fogetPasswordFormKey,
            child: Column(
              children: [
                SizedBox(height: 28.h),
                Text(
                  "Forgot Password",
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
                  child: Image.asset(AppImages.sadBoy),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Enter the email address\nassociated with your account.",
                  style: TextStyle(
                    fontSize: 15.h,
                    height: 1.5,
                    color: AppColors.textBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text(
                  "We will email you a link to reset\nyour password.",
                  style: TextStyle(
                    fontSize: 11.h,
                    height: 1.5,
                    color: AppColors.textBlack2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                  child: AppTextFormField(
                    controller: _controller.emailTextEditingController,
                    hint: "Email/Mobile Number",
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return "Enter email or number";
                      }
                      if (value.startsWith(RegExp(r'^\d'))) {
                        if (value.length != 10) {
                          return "Phone Number is not valid";
                        }
                      } else {
                        if (!AppValidator.emailValidtor(value)) {
                          return "Invalid Email";
                        }
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GetBuilder(
                    init: _controller,
                    initState: (_) {},
                    id: "Forget Password Button",
                    builder: (_) {
                      return AppElevatedButton(
                        text: "CONTINUE",
                        isLoading: _controller.isSignUpLoading,
                        onPressed: () {
                          if (_controller.fogetPasswordFormKey.currentState!
                              .validate()) {
                            _controller.sendEmailForForgetPassword();
                            Get.toNamed(AppRoute.forgetPasswordVerify);
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
