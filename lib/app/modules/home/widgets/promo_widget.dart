import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/widgets/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? lowerText;
  final String? label;
  final String? thumbnail;
  final void Function()? onTap;
  const PromoWidget(
      {super.key,
      this.title,
      this.subtitle,
      this.lowerText,
      this.label,
      this.onTap,
      this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          thumbnail ?? "",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r)))),
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 12.w, right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "",
                      style: TextStyle(
                          fontSize: 18.h,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      subtitle ?? "",
                      style: TextStyle(
                          fontSize: 12.h,
                          color: AppColors.textBlack3,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    const DottedDivider(),
                    SizedBox(height: 8.h),
                    Text(
                      lowerText ?? "",
                      style: TextStyle(
                          fontSize: 12.h,
                          color: AppColors.textBlack3,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 120.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageIcon(
                    const AssetImage(AppImages.union),
                    color: Colors.white,
                    size: 115.h,
                  ),
                  Positioned(
                      top: 44.h,
                      child: Text(
                        label ?? "",
                        style: TextStyle(
                            fontSize: 10.h,
                            color: label == "LIVE"
                                ? AppColors.textRed
                                : AppColors.secondary,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
