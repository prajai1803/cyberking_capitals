import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(height: 130.h),
          Image.asset(AppImages.commingSoon, width: 300.w),
          SizedBox(height: 96.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Oops! Looks Like You're Offline",
              style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 23),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Please check your Internet connection and try again!",
              style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack2),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
