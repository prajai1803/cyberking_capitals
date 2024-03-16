import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/widgets/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModuleTile extends StatelessWidget {
  final String? title;
  final String? description;
  final int? session;
  final String? duration;
  final int? index;
  const ModuleTile({
    super.key,
    this.title,
    this.description,
    this.session,
    this.duration,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        SizedBox(
          height: 120.h,
          child: Stack(
            children: [
              Row(
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
                            fontSize: 14.sp,
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
                                fontSize: 12.sp,
                                color: AppColors.textBlack2),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.tv,
                                    size: 18.h, color: AppColors.textBlack2),
                                SizedBox(width: 6.w),
                                Text(
                                  "${(session ?? 0)} Sessions",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.textBlack2),
                                ),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            Row(
                              children: [
                                Icon(Icons.timelapse,
                                    size: 18.h, color: AppColors.textBlack2),
                                SizedBox(width: 6.w),
                                Text(
                                  duration ?? "N/A",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textBlack2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 110.h,
                    width: 110.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 30.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xeFF1F5FF)),
                  child: Text(
                    "${(index ?? 0)}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Rakkas",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const DottedDivider(),
      ],
    );
  }
}
