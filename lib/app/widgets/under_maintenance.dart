import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUnderMaintenance extends StatelessWidget {
  final String msg;
  const AppUnderMaintenance({super.key, this.msg = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.commingSoon,
              height: 216.h,
            ),
            SizedBox(height: 32.h),
            Text(
              "App Is Under Maintenance !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.h,
                height: 1.5,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              " $msg",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.h,
                height: 1.5,
                color: AppColors.textBlack2,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
