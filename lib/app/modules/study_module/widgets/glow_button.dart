import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlowButton extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  final Color? color;
  const GlowButton({
    super.key,
    this.text,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black.withOpacity(.25),
              )
            ],
            border: Border.all(width: 1, color: color ?? AppColors.secondary),
            borderRadius: BorderRadius.circular(15.r)),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.h,
            color: color ?? AppColors.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
