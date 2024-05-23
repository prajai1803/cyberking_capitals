import 'package:cyberking_capitals/app/data/providers/api/api_routes.dart';
import 'package:cyberking_capitals/app/data/providers/session_db.dart';
import 'package:cyberking_capitals/app/data/services/api/api_service.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiProvider {
  final ApiService _apiService = ApiService();
  final SessionDB _sessionDB = SessionDB();

  // authenciation
  Future<Response?> login(String? email, String password, String? phone) async {
    try {
      final res = await _apiService.post(
          url: ApiRoutes.login,
          body: {"email": email, "password": password, "mobile_number": phone});
      if (res.statusCode == 200) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> signUp(
      String? email, String password, String? phone, String name) async {
    try {
      final res = await _apiService.post(url: ApiRoutes.signUp, body: {
        "email": email,
        "password": password,
        "mobile": phone,
        "role": "student",
        "name": name
      });
      if (res.statusCode == 201) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> generateOtp(String email) async {
    try {
      final res = await _apiService
          .post(url: ApiRoutes.generateOtp, body: {"email": email});

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> forgetPasswordGenerateOtp(String email) async {
    try {
      final res = await _apiService.post(
          url: ApiRoutes.forgetPasswordGenerateOTP, body: {"email": email});

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> forgetPasswordVerifyOtp(
      String email, String otp, String? newPassword) async {
    try {
      final res = await _apiService.post(
          url: ApiRoutes.forgetPasswordVerifyOTP,
          body: {"email": email, "otp": otp, "newPassword": newPassword});

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> verifyOtp(String email, String otp) async {
    try {
      final res = await _apiService
          .post(url: ApiRoutes.verifyOtp, body: {"email": email, "otp": otp});

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> submitSession(int? studentId, int? sessionId) async {
    final token = await getAccessToken();
    try {
      final res = await _apiService.post(url: ApiRoutes.submitSession, body: {
        "student_id": studentId,
        "session_id": sessionId,
      }, header: {
        "Authorization": token
      });
      if (res.statusCode == 201) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> submitQuiz(int? studentId, int? quizScore) async {
    final token = await getAccessToken();
    try {
      final res = await _apiService.post(url: ApiRoutes.submitSession, body: {
        "student_id": studentId,
        "quiz_score": quizScore,
      }, header: {
        "Authorization": token
      });
      if (res.statusCode == 201) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  // attendance
  Future<Response?> submitAttendance(int? batchId) async {
    final token = await getAccessToken();
    try {
      final res =
          await _apiService.post(url: ApiRoutes.submitAttendance, body: {
        "batchId": batchId,
        "status": "present",
      }, header: {
        "Authorization": token
      });
      if (res.statusCode == 201) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getAttendanceStudentHistory(
      int? studentId, String startDate, String endDate) async {
    try {
      final accessToken = await getAccessToken();

      final res = await _apiService.get(
        url: "${ApiRoutes.getAttendanceHistory}/$studentId",
        header: {"Authorization": accessToken},
        // data formate 2024-05-01
        query: {"start_date": startDate, "end_date": endDate},
      );

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  // profile
  Future<Response?> getProfile() async {
    try {
      final accessToken = await getAccessToken();

      final res = await _apiService.get(
          url: ApiRoutes.getProfile, header: {"Authorization": accessToken});

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> updateProfile() async {
    try {
      final accessToken = await getAccessToken();

      final res = await _apiService.post(
          url: ApiRoutes.updateStudentProfile,
          header: {"Authorization": accessToken},
          body: {"phone_number_verified": "1"});

      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getSessionByModuleId(int moduleId) async {
    try {
      final res = await _apiService.get(
          url: "${ApiRoutes.getSessionByModueId}/$moduleId");
      if (res.statusCode == 200) {
        return res;
      } else if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getHomeQueries(int? studentId) async {
    try {
      final accessToken = await getAccessToken();
      final res = await _apiService.get(
          url: "${ApiRoutes.homeQuery}/$studentId",
          header: {"Authorization": accessToken});
      if (res.statusCode == 200) {
        return res;
      } else if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getQuiz(int? moduleId) async {
    try {
      final accessToken = await getAccessToken();
      final res = await _apiService.get(
          url: "${ApiRoutes.getQuiz}/$moduleId",
          header: {"Authorization": accessToken});
      if (res.statusCode == 200) {
        return res;
      } else if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getProgressBar(int? studentId) async {
    try {
      final accessToken = await getAccessToken();
      final res = await _apiService.get(
          url: "${ApiRoutes.progressBar}/$studentId",
          header: {"Authorization": accessToken});
      if (res.statusCode == 200) {
        return res;
      } else if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  // intro video
  Future<Response<dynamic>?> getIntroVideo() async {
    try {
      final res =
          await _apiService.get(url: "${ApiRoutes.getIntroVideo}/1/?tag=intro");
      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response<dynamic>?> getRefreshToken() async {
    try {
      final refreshToken = await SessionDB().getRefreshToken();
      final res = await _apiService.post(
          url: ApiRoutes.getRefreshToken, body: {"rfToken": refreshToken});
      if (res.statusCode == 200) {
        return res;
      }
      if (res.statusCode == 400) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {}
    return null;
  }

  Future getAccessToken() async {
    final String? token = await _sessionDB.getAccessToken();
    if (token == null || JwtDecoder.isExpired(token)) {
      final res = await getRefreshToken();
      if (res != null) {
        final accessToken = res.body["data"]["access_token"];
        final refreshToken = res.body["data"]["refresh_token"];
        await SessionDB().setAccessToken(accessToken);
        await SessionDB().setRefreshToken(refreshToken);
        return accessToken;
      }
    } else {
      return token;
    }
  }

  void _checkException(Response<dynamic> res) {
    String? msg = res.body['message'];
    if (res.statusCode == 404) {
      throw ApiStatusException(message: msg ?? "Url Not Found");
    } else if (res.statusCode == 401) {
      throw ApiStatusException(message: msg ?? "Not Authorized");
    } else if (res.statusCode == 500) {
      throw ApiStatusException(message: msg ?? "Server Error");
    } else if (res.statusCode == 400) {
      throw ApiStatusException(message: msg ?? "bad request");
    } else {
      throw ApiStatusException();
    }
  }
}
