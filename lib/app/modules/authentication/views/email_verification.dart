import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    style: TextStyle(
                      fontSize: 24.h,
                      color: AppColors.textBlack,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: AppElevatedButton(
                  text: "Verify OTP",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                "Resend in 30s",
                style: TextStyle(
                  fontSize: 11.h,
                  height: 1.5,
                  color: AppColors.textBlack2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
