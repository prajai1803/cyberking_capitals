// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTextFormField extends StatelessWidget {
  String labeltext;
  bool isValidate = false;
  bool readOnly = false;
  FormFieldValidator<String>? validator;
  void Function()? onTap;
  TextInputType? keyboardType;
  TextEditingController controller = TextEditingController();

  ProfileTextFormField({
    super.key,
    required this.labeltext,
    required this.controller,
    this.isValidate = false,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.h),
        focusColor: Colors.black,
        contentPadding: EdgeInsets.only(right: 40.w, left: 12.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        labelText: labeltext,
        counterStyle: Theme.of(context).textTheme.bodyLarge,
        helperStyle: Theme.of(context).textTheme.bodyLarge,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
