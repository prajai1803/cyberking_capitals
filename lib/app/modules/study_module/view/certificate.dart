import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certificate"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 32.h),
          _buildSideTag(),
          SizedBox(height: 48.h),
          _buildCongratulation(),
          SizedBox(height: 32.h),
          _buildTechnicalAnalysis(),
          SizedBox(height: 48.h),
          _buildScoreAndDate(),
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 9.h,
                    horizontal: 9.w,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColors.secondary)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.download,
                        size: 16.r,
                        color: AppColors.secondary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Order Now",
                        style: TextStyle(
                            fontSize: 12.h,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 9.h,
                    horizontal: 9.w,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColors.secondary)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.download,
                        size: 16.r,
                        color: AppColors.secondary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Download",
                        style: TextStyle(
                            fontSize: 12.h,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 9.h,
                    horizontal: 9.w,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColors.secondary)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.share_outlined,
                        size: 16.r,
                        color: AppColors.secondary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "share",
                        style: TextStyle(
                            fontSize: 12.h,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  Row _buildScoreAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "88/100",
              style: TextStyle(
                fontSize: 16.h,
                fontFamily: "Rakkas",
                color: AppColors.secondary,
              ),
            ),
            Text(
              "Point scored:",
              style: TextStyle(
                  fontSize: 12.h,
                  color: AppColors.textBlack2,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "01/01/2024",
              style: TextStyle(
                fontSize: 16.h,
                fontFamily: "Rakkas",
                color: AppColors.secondary,
              ),
            ),
            Text(
              "Issued on:",
              style: TextStyle(
                  fontSize: 12.h,
                  color: AppColors.textBlack2,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }

  Column _buildTechnicalAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Technical Analysis",
            style: TextStyle(
              fontFamily: "Playball",
              fontSize: 20.h,
              fontWeight: FontWeight.w500,
            )),
        Container(
          width: 40.w,
          height: 4.h,
          margin: EdgeInsets.only(top: 6.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.secondary),
        ),
      ],
    );
  }

  Column _buildCongratulation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Congratulations, Krutika !",
            style: TextStyle(
              fontFamily: "Playball",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 12.h),
        Text(
            "You have successfully completed the mandatory requirements prescribed by Cyberking Capitals and passed the certification program in",
            style: TextStyle(
              fontSize: 14.h,
              color: AppColors.textBlack3,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }

  Column _buildSideTag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Certificate of",
            style: TextStyle(
              fontFamily: "Playball",
              fontSize: 16.h,
            )),
        Text("Completion",
            style: TextStyle(
                fontFamily: "Playball",
                fontSize: 40.h,
                color: AppColors.secondary)),
      ],
    );
  }
}
