import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.commingSoon,
            height: 216.h,
          ),
          SizedBox(height: 32.h),
          Text(
            "Comming Soon\n We are working hard...!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.h,
              height: 1.5,
              color: AppColors.textBlack2,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
