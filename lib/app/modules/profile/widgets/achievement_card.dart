import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AchievementCard extends StatelessWidget {
  final String? title;
  final String? image;
  final int? percentage;
  final void Function()? onTap;
  const AchievementCard({
    super.key,
    this.title,
    this.image,
    this.percentage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 80.r,
              width: 80.r,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://firebasestorage.googleapis.com/v0/b/fir-student-app-67f4f.appspot.com/o/certificate_images%2F4518a718055d1cf68ab4ad18c77f6d15.gif?alt=media&token=77bfffbd-3af2-4a9e-b386-ef2b91f5c537",
                  height: 80.h,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: Container(
                      color: Colors.white,
                      height: 80.r,
                      width: 80.r,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 24.h,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${(title ?? "").reduceTo(24)} ...",
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: 206.w,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: percentage ?? 0,
                      size: 5,
                      padding: 0,
                      roundedEdges: Radius.circular(30.r),
                      selectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red,
                          Colors.red.withOpacity(.5),
                          Colors.red.withOpacity(.1),
                        ],
                      ),
                      unselectedColor: Colors.red.withOpacity(.08),
                    ),
                  ),
                  Text(
                    "${percentage ?? "0"}/100",
                    style: TextStyle(
                      fontSize: 16.h,
                      fontFamily: "Rakkas",
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
