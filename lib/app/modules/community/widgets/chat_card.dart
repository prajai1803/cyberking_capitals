import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  final String? chatName;
  final String? msg;
  final int? count;
  final String? data;
  final void Function()? onTap;
  const ChatCard({
    super.key,
    this.chatName,
    this.msg,
    this.count,
    this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleCachedImage(imageUrl: "", radius: 24),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chatName ?? "N/A",
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        data ?? "NA",
                        style: TextStyle(
                            fontSize: 12.h, color: AppColors.textBlack3),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        msg ?? "Not message yet",
                        style: TextStyle(
                            fontSize: 12.h, color: AppColors.textBlack3),
                      ),
                      count != null
                          ? Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary,
                              ),
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 10.h,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
