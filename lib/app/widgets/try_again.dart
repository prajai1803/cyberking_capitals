import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/animations.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class TryAgain extends StatelessWidget {
  final void Function()? onPressed;
  const TryAgain({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: double.infinity,
              child: Lottie.asset(LottieAnimations.networkError,
                  fit: BoxFit.cover, repeat: false)),
          Column(
            children: [
              Text(
                "OOPS !!",
                style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack),
              ),
              Text(
                "Something went wrong",
                style: TextStyle(
                    fontSize: 16.h,
                    height: 2,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: AppElevatedButton(
                  text: "Try Again",
                  onPressed: onPressed,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
