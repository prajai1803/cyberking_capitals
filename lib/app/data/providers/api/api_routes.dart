class ApiRoutes {
  // authentication
  static const login = 'api/students/login';
  static const signUp = 'api/register/register';

  // otp
  static const generateOtp = 'api/verify/email/generate';
  static const verifyOtp = 'api/verify/email/verify';

  // forget password
  static const forgetPasswordGenerateOTP = 'api/forget-password/generate-otp';
  static const forgetPasswordVerifyOTP = 'api/forget-password/verify-otp';

  // profile
  static const getProfile = 'api/profile/student-profile';

  static const getIntroVideo = 'api/videos/get-video';

  static const featureVideoList = 'feature-video-list';
  static const getModules = 'api/Modules/get-modules';
}
