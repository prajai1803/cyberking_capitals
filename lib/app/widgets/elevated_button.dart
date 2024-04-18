import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final void Function()? onPressed;
  const AppElevatedButton(
      {super.key, required this.text, this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onPressed,
          child: isLoading!
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )),
    );
  }
}
