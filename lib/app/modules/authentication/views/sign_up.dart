import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/authentication/controller.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:cyberking_capitals/app/widgets/text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _controller.signUpFormKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              _buildLogo(),
              SizedBox(height: 32.h),
              _buildSignUp(),
              SizedBox(height: 24.h),
              _buildTextField(),
              SizedBox(height: 12.h),
              _buildTnC(),
              SizedBox(height: 32.h),
              GetBuilder(
                init: _controller,
                initState: (_) {},
                id: "Sign Up",
                builder: (_) {
                  return AppElevatedButton(
                      text: "CONTINUE",
                      isLoading: _controller.isSignUpLoading,
                      onPressed: () {
                        if (!_controller.isSignUpLoading) {
                          _controller.signUp();
                        }
                      });
                },
              ),
              SizedBox(height: 16.h),
              _buildLogin(),
            ]),
          ),
        ),
      ),
    );
  }

  Column _buildSignUp() {
    return Column(
      children: [
        Text("Sign up ",
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w400,
            )),
        Text("Create an account with us ",
            style: TextStyle(
              fontSize: 12.h,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }

  Row _buildLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have account ?",
            style: TextStyle(
              fontSize: 12.h,
              fontWeight: FontWeight.w400,
            )),
        InkWell(
          onTap: () => Get.back(),
          child: Text(" login ",
              style: TextStyle(
                fontSize: 14.h,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              )),
        )
      ],
    );
  }

  Text _buildTnC() {
    return Text.rich(
      TextSpan(
          text: "By signing up, you agree to our ",
          style: TextStyle(fontSize: 12.h),
          children: [
            TextSpan(
              text: "Terms & Conditions",
              style: TextStyle(
                fontSize: 14.h,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: 'Privacy Policy',
              recognizer: TapGestureRecognizer()..onTap = () => {},
              style: TextStyle(
                fontSize: 14.h,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
    );
  }

  Column _buildTextField() {
    return Column(
      children: [
        AppTextFormField(
          controller: _controller.nameTextEditingController,
          hint: 'Enter your Full Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter name";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        AppTextFormField(
          controller: _controller.emailTextEditingController,
          hint: 'Email ID/Mobile Number',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter email/mobile";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        GetBuilder(
          init: _controller,
          id: "password",
          builder: (_) {
            return AppTextFormField(
              controller: _controller.passwordTextEditingController,
              hint: 'Create New Password',
              isPasswardField: true,
              obscureText: !_controller.isPasswordVisible,
              onPasswordIconPressed: () =>
                  _controller.updatePasswordVisiblity(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }

                return null;
              },
            );
          },
        ),
        SizedBox(height: 12.h),
        GetBuilder(
          init: _controller,
          id: "password2",
          builder: (_) {
            return AppTextFormField(
              controller: _controller.confirmPasswordTextEditingController,
              hint: 'Confirm New Password',
              isPasswardField: true,
              obscureText: !_controller.isConfirmPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }
                if (value != _controller.passwordTextEditingController.text) {
                  return "Password does not match";
                }
                return null;
              },
              onPasswordIconPressed: () =>
                  _controller.updateConfirmPasswordVisiblity(),
            );
          },
        ),
      ],
    );
  }

  Container _buildLogo() {
    return Container(
        padding: EdgeInsets.only(top: 80.h),
        width: 150.w,
        child: Image.asset(AppImages.logo));
  }
}
