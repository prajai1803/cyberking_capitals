import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 191.h,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          borderRadius: BorderRadiusGeometry.lerp(BorderRadius.circular(10),
              BorderRadius.circular(10), BorderSide.strokeAlignCenter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 32.h, left: 24.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log out?",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              SizedBox(height: 16.h),
              Container(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Text(
                    "Are you sure want to Log out?",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlack3),
                  )),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 48.h,
                        width: 132.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Builder(builder: (context) {
                          return Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack3),
                          );
                        }),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(132.w, 48.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
