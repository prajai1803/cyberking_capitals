import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/firebase_provider.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';

class AuthRepositry {
  final FirebaseProvider firebaseProvider;
  final ApiProvider apiProvider;
  AuthRepositry({required this.firebaseProvider, required this.apiProvider});

  Future<Map<String, dynamic>?> loginWithEmailorPhoneNumber(
    String? email,
    String? phone,
    String password,
  ) async {
    try {
      final res = await apiProvider.login(email, password, phone);
      if (res != null) {
        final resBody = res.body;
        if (resBody["success"] == true) {
          return resBody["data"] as Map<String, dynamic>;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<bool> signUp(
    String? email,
    String? phone,
    String password,
    String name,
  ) async {
    try {
      final res = await apiProvider.signUp(email, password, phone, name);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<bool> generateOTP(
    String email,
  ) async {
    try {
      final res = await apiProvider.generateOtp(email);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<bool> verifyOTP(
    String email,
    String otp,
  ) async {
    try {
      final res = await apiProvider.verifyOtp(email, otp);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else if (resBody["message"] == "Email already verified.") {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<bool> updateProfile() async {
    try {
      final res = await apiProvider.updateProfile();
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<bool> forgetPasswordGenerateOTP(
    String email,
  ) async {
    try {
      final res = await apiProvider.forgetPasswordGenerateOtp(email);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<bool> forgetPasswordVerifyOTP(
    String email,
    String otp,
    String newPassword,
  ) async {
    try {
      final res =
          await apiProvider.forgetPasswordVerifyOtp(email, otp, newPassword);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<UserModel?> getProfile() async {
    try {
      final res = await apiProvider.getProfile();
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          final userModel =
              UserModel.fromJson(resBody["data"][0] as Map<String, dynamic>);

          return userModel;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
