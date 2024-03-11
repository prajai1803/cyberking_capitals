import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/authentication/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/utils/validators.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:cyberking_capitals/app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _controller = Get.find<AuthController>();
  final screenHeight = ScreenUtil().screenHeight;

  bool isAnimationOvered = false;
  bool isAnimationComplete = false;

  late AnimationController animationController;

  late final Animation<double> logoPositionY;
  late final Animation<double> textPositionY;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    textPositionY =
        Tween<double>(begin: screenHeight * .60, end: screenHeight * .280)
            .animate(animationController);
    logoPositionY =
        Tween<double>(begin: 330.h, end: 590.h).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => startAnimation());
    super.initState();
  }

  void startAnimation() {
    setState(() {
      animationController.forward().then((value) => {completeAnimatation()});
    });
  }

  void completeAnimatation() {
    setState(() {
      isAnimationComplete = true;
      Future.delayed(
        const Duration(seconds: 1),
        () => overAnimation(),
      );
    });
  }

  void overAnimation() {
    setState(() {
      isAnimationOvered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _controller.loginFormKey,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildLogo(),
                    SizedBox(height: 32.h),
                    _buildEmailField(),
                    SizedBox(height: 12.h),
                    _buildPasswordField(),
                    SizedBox(height: 12.h),
                    _buildForgotPasswordButton(),
                    SizedBox(height: 32.h),
                    _buildLoginButton(),
                    SizedBox(height: 16.h),
                    _buildDevider(),
                    SizedBox(height: 16.h),
                    _buildLoginWithGoogle(),
                    SizedBox(height: 12.h),
                    _buildAccount(),
                  ],
                ),
              ),
              Visibility(
                visible: !isAnimationOvered,
                child: AnimatedOpacity(
                  opacity: isAnimationComplete == true ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    height: screenHeight,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 173, 12, 28),
                  ),
                ),
              ),
              if (!isAnimationComplete)
                Positioned(
                    bottom: logoPositionY.value,
                    child: Image.asset(
                      AppImages.logoWithWhiteBG,
                      width: 136.w,
                    )),
              if (!isAnimationComplete)
                Center(
                  child: Container(
                      padding: EdgeInsets.only(top: textPositionY.value),
                      width: 213.w,
                      child: Image.asset(AppImages.splashLogo)),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => Get.toNamed(AppRoute.forgetPassword),
        child: Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
      ),
    );
  }

  Row _buildAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have Account ?",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            )),
        InkWell(
          onTap: () {
            _controller.clearTextEditingController();
            Get.toNamed(AppRoute.signUp);
          },
          child: Text(" Sign up ",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              )),
        )
      ],
    );
  }

  Row _buildDevider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 2,
            color: Colors.black,
            thickness: .3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Text(
            " Or ",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            height: 2,
            color: Colors.black,
            thickness: .3,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginWithGoogle() {
    return InkWell(
      onTap: () {
        _controller.loginWithGoogle();
      },
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xeFFAFAFB),
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(5.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.googleIcon, height: 24.h),
            SizedBox(width: 16.w),
            Text(
              "Sign-In with Google",
              style: TextStyle(
                fontSize: 12.h,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return AppElevatedButton(
      text: "LOGIN",
      onPressed: () {
        _controller.login();
      },
    );
  }

  GetBuilder<AuthController> _buildPasswordField() {
    return GetBuilder(
      init: _controller,
      id: "password",
      builder: (_) {
        return AppTextFormField(
          controller: _controller.passwordTextEditingController,
          isPasswardField: true,
          validator: (password) {
            if (password == null || password.isEmpty) {
              return "Password can not be empty";
            }
            return null;
          },
          hint: "Password",
          obscureText: !_controller.isPasswordVisible,
          onPasswordIconPressed: () {
            _controller.updatePasswordVisiblity();
          },
        );
      },
    );
  }

  AppTextFormField _buildEmailField() {
    return AppTextFormField(
      controller: _controller.emailTextEditingController,
      hint: 'Email/Mobile Number',
      validator: (email) {
        if (!AppValidator.emailValidtor(email!)) {
          return "Invalid Email";
        }
        return null;
      },
    );
  }

  Container _buildLogo() {
    return Container(
        padding: EdgeInsets.only(top: 73.h),
        width: 200.w,
        child: Image.asset(AppImages.logo));
  }
}
