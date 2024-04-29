import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUpdates {
  static Future<void> showAppUpdate(context,
      {String? updateContent, required String version}) async {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.greenBG,
                    ),
                    Image.asset(
                      AppImages.rocket,
                      height: 100.h,
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  "App Update",
                  style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                Container(
                  margin: EdgeInsets.only(right: 24.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Ver $version",
                    style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary),
                  ),
                ),
                SizedBox(height: 14.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    updateContent ?? "",
                    style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: AppColors.textBlack3),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {},
                        child: Text(
                          "Update Now",
                          style: TextStyle(
                            fontSize: 12.h,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 14.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
