class ApiRoutes {
  // authentication
  static const login = 'api/students/login';
  static const signUp = 'api/register/register';
  static const getRefreshToken = 'api/students/refreshToken-verify';

  // otp
  static const generateOtp = 'api/verify/email/generate';
  static const verifyOtp = 'api/verify/email/verify';

  // forget password
  static const forgetPasswordGenerateOTP = 'api/forget-password/generate-otp';
  static const forgetPasswordVerifyOTP = 'api/forget-password/verify-otp';

  // profile
  static const getProfile = 'api/profile/student-profile';
  static const getIntroVideo = 'api/videos/get-video';

  // home api
  static const homeQuery = 'api/mobile/home/get';

  static const featureVideoList = 'feature-video-list';
  static const getModules = 'api/Modules/get-modules';
  static const getAllModules = 'api/Modules/get-all';
  static const getSessionByModueId = 'api/sessions/get-sessions';

  // attendance
  static const submitAttendance =
      'api/attendance/manage-attendance/v1/submit-attendance';
  static const getAttendanceHistory =
      'api/attendance/manage-attendance/v1/student/attendance-history';
}
