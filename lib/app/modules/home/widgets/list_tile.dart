import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? imageIcon;
  final int? colorCode;
  final void Function()? onTap;
  const CustomListTile({
    super.key,
    this.title,
    this.subTitle,
    this.imageIcon,
    this.onTap,
    this.colorCode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.h,
            backgroundColor: Color(colorCode ?? 0xeFE09C32).withOpacity(.20),
            child: ImageIcon(
                AssetImage(
                  imageIcon ?? AppImages.progressIcon,
                ),
                size: 16.h,
                color: Color(colorCode ?? 0xeFE09C32)),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? "",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(
                        "Sell all",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  subTitle ?? "",
                  style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack3),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
