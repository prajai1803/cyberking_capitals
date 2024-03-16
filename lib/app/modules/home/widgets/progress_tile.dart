import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressTile extends StatelessWidget {
  final String? value;
  final String? title;
  final Color? color;

  const ProgressTile({super.key, this.value, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 156.w,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(.25))
          ],
          borderRadius: BorderRadius.circular(5.r)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 90.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: color ?? Colors.white,
              borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              value ?? "NA",
              style: TextStyle(fontFamily: "Rakkas", fontSize: 24.sp),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
          child: Text(
            title ?? "",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        )
      ]),
    );
  }
}
