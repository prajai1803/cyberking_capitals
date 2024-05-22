import 'package:cyberking_capitals/app/modules/authentication/bindings.dart';
import 'package:cyberking_capitals/app/modules/authentication/view.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/email_verification.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/firebase_phone_verification.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/forget_password.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/password_verification.dart';
import 'package:cyberking_capitals/app/modules/authentication/views/sign_up.dart';
import 'package:cyberking_capitals/app/modules/base/bindings.dart';
import 'package:cyberking_capitals/app/modules/base/view.dart';
import 'package:cyberking_capitals/app/modules/home/view/module_video.dart';
import 'package:cyberking_capitals/app/modules/on_boarding/bindings.dart';
import 'package:cyberking_capitals/app/modules/on_boarding/view.dart';
import 'package:cyberking_capitals/app/modules/profile/bindings.dart';
import 'package:cyberking_capitals/app/modules/profile/view.dart';
import 'package:cyberking_capitals/app/modules/profile/view/edit_profile.dart';
import 'package:cyberking_capitals/app/modules/profile/view/membership.dart';
import 'package:cyberking_capitals/app/modules/profile/view/my_achievement.dart';
import 'package:cyberking_capitals/app/modules/quiz/bindings.dart';
import 'package:cyberking_capitals/app/modules/quiz/view.dart';
import 'package:cyberking_capitals/app/modules/quiz/view/quiz_result.dart';
import 'package:cyberking_capitals/app/modules/refer/bindings.dart';
import 'package:cyberking_capitals/app/modules/refer/view.dart';
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
      title: 'Email Verification',
      name: AppRoute.emailVerify,
      page: () => const EmailVerifyScreen(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      title: 'Phone Number Verification',
      name: AppRoute.phoneVerify,
      page: () => const FirebaseVerifyScreen(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      title: 'Password Verification',
      name: AppRoute.forgetPasswordVerify,
      page: () => const PasswordVerifyScreen(),
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
      page: () => AllSession(),
      binding: StudyModuleBindings(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      title: "Quiz",
      name: AppRoute.quiz,
      page: () => const QuizScreen(),
      binding: QuizBindings(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      title: "Quiz Result",
      name: AppRoute.quizResult,
      page: () => QuizResultScreen(),
      binding: QuizBindings(),
      transition: Transition.downToUp,
    ),
    GetPage(
      title: "Profile",
      name: AppRoute.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      title: "Profile Edit",
      name: AppRoute.editProfile,
      page: () => EditProfileScreen(),
      binding: ProfileBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      title: "My Achievement",
      name: AppRoute.myAchievement,
      page: () => const MyAchievementScreen(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      title: 'Membership',
      name: AppRoute.membership,
      page: () => const MembershipScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      title: "Refer",
      name: AppRoute.refer,
      page: () => ReferScreen(),
      binding: ReferBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
