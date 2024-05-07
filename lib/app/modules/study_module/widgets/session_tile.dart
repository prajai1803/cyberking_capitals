import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/utils/extension.dart';
import 'package:cyberking_capitals/app/widgets/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SessionTile extends StatelessWidget {
  final String? title;
  final String? description;
  final int? session;
  final String? duration;
  final String? thumbnail;
  final int? index;
  final void Function()? onTap;
  const SessionTile(
      {super.key,
      this.title,
      this.description,
      this.session,
      this.duration,
      this.index,
      this.onTap,
      this.thumbnail});

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
                          "${(description ?? "N/A").reduceTo(120)}...",
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: thumbnail ??
                                "https://cdn-scripbox-wordpress.scripbox.com/wp-content/uploads/2022/08/mutual-fund-cut-off-time-image-1024x1024.jpg",
                            height: 110.h,
                            width: 110.h,
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.srcOver,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 110.h,
                                width: 110.h,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                                height: 110.h,
                                width: 110.h,
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.error_outline,
                                  size: 34.h,
                                )),
                          ),
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
