import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/widgets/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionTile extends StatelessWidget {
  final String? title;
  final String? description;
  final int? session;
  final String? duration;
  final int? index;
  final void Function()? onTap;
  const SessionTile(
      {super.key,
      this.title,
      this.description,
      this.session,
      this.duration,
      this.index,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? "N/A",
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: 173.w,
                        child: Text(
                          description ?? "NA",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.h,
                              color: AppColors.textBlack2),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.timelapse,
                              size: 18.h, color: AppColors.textBlack2),
                          SizedBox(width: 6.w),
                          Text(
                            duration ?? "N/A",
                            style: TextStyle(
                              fontSize: 12.h,
                              color: AppColors.textBlack2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 110.h,
                          width: 110.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xeFF1F5FF)),
                        child: Text(
                          "${(index ?? 0)}",
                          style: TextStyle(
                            fontSize: 12.h,
                            fontFamily: "Rakkas",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const DottedDivider(),
        ],
      ),
    );
  }
}
