import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  String? Function(String?)? validator;
  final bool isPasswardField;
  final bool obscureText;
  final void Function()? onPasswordIconPressed;
  AppTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.hint = '',
      this.isPasswardField = false,
      this.obscureText = false,
      this.onPasswordIconPressed});

  Widget getObscureIcons() {
    if (obscureText) {
      return IconButton(
        icon: Icon(
          Icons.visibility_off_outlined,
          size: 24.h,
          color: AppColors.textField,
        ),
        onPressed: onPasswordIconPressed,
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.visibility_outlined,
          size: 24.h,
          color: AppColors.textField,
        ),
        onPressed: onPasswordIconPressed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      cursorColor: AppColors.secondary,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.textField.withOpacity(.02),
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.textBlack,
          fontWeight: FontWeight.w300,
        ),
        suffixIcon: isPasswardField ? getObscureIcons() : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
