import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final screenHeight = ScreenUtil().screenHeight;

  late AnimationController animationController;
  late final Animation<double> logoPositionY;
  late final Animation<double> logoScaleY;

  bool isAnimationStart = false;
  bool isAnimationStep2 = false;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    logoScaleY =
        Tween<double>(begin: 0.01, end: 1).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 1))
        .then((value) => startAnimation());
    super.initState();
  }

  void startAnimation() {
    setState(() {
      isAnimationStart = true;
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 173, 12, 28),
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            top: isAnimationStart ? screenHeight * 0.60 : screenHeight * .44,
            duration: const Duration(milliseconds: 300),
            child: InkWell(
              onTap: () {
                startAnimation();
              },
              child: Image.asset(
                AppImages.splashLogo,
                width: 213.w,
              ),
            ),
          ),
          isAnimationStart
              ? Positioned(
                  bottom: 330.h,
                  child: Transform.scale(
                    scaleY: logoScaleY.value,
                    child: Image.asset(
                      AppImages.logoWithWhiteBG,
                      width: 136.w,
                    ),
                  ),
                )
              : Positioned(
                  top: screenHeight * .475,
                  child: Container(
                    height: 2.h,
                    width: 146.w,
                    color: Colors.white,
                  ),
                ),
        ],
      )),
    );
  }
}
