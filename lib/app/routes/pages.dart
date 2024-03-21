import 'package:cyberking_capitals/app/modules/authentication/bindings.dart';
import 'package:cyberking_capitals/app/modules/authentication/view.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/forget_password.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/sign_up.dart';
import 'package:cyberking_capitals/app/modules/base/bindings.dart';
import 'package:cyberking_capitals/app/modules/base/view.dart';
import 'package:cyberking_capitals/app/modules/home/view/module_video.dart';
import 'package:cyberking_capitals/app/modules/on_boarding/bindings.dart';
import 'package:cyberking_capitals/app/modules/on_boarding/view.dart';
import 'package:cyberking_capitals/app/modules/splash/binding.dart';
import 'package:cyberking_capitals/app/modules/splash/view.dart';
import 'package:cyberking_capitals/app/modules/study_module/binding.dart';
import 'package:cyberking_capitals/app/modules/study_module/view.dart';
import 'package:cyberking_capitals/app/modules/study_module/view/all_session.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      title: 'Splash',
      name: AppRoute.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      title: 'Login',
      name: AppRoute.loginScreen,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
      // transition: Transition.zoom,
    ),
    GetPage(
      title: 'Sign up',
      name: AppRoute.signUp,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      title: 'Forget Password',
      name: AppRoute.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      title: 'OnBoarding',
      name: AppRoute.onBoarding,
      page: () => OnBoaringScreen(),
      binding: OnBoardingBindings(),
      transition: Transition.zoom,
    ),
    GetPage(
      title: 'App Base',
      name: AppRoute.appBase,
      page: () => const AppBaseScreen(),
      binding: AppBaseBindings(),
      transition: Transition.zoom,
    ),
    GetPage(
      title: 'Module Video',
      name: AppRoute.moduleVideo,
      page: () => const ModuleVideoPlayer(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      title: "Study Module",
      name: AppRoute.studyModule,
      page: () => const StudyModule(),
      binding: StudyModuleBindings(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      title: "All Session",
      name: AppRoute.allSession,
      page: () => const AllSession(),
      binding: StudyModuleBindings(),
      transition: Transition.cupertinoDialog,
    )
  ];
}
