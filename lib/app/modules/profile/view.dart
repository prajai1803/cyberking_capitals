import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/logout.dart';
import 'widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xeFF5F6FB),
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(
            color: AppColors.textBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 32.h),
          Container(
            height: 96.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: CircleAvatar(
                  radius: 32.r,
                  child: Image.asset(AppImages.achievments),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Krutika Singh",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "KrutikaSingh180@ckc.com",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: AppColors.textBlack3),
                  )
                ],
              ),
            ]),
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {},
            title: "MemberShip",
            iconData: Icons.wallet_membership_outlined,
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {},
            title: "Certificate",
            iconData: Icons.celebration,
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {},
            title: "Invite Friends",
            iconData: Icons.group,
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const LogoutDialog();
                },
              );
            },
            title: "Logout",
            iconData: Icons.logout,
          ),
        ],
      )),
    );
  }
}
