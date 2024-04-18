import 'package:cyberking_capitals/app/data/services/storage/service.dart';

class SessionDB extends StorageService {
  final StorageService _storageService = StorageService();

  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const userAuthStatus = '_authStatus_';
  static const isOnBoardingComplete = '_isOnBoaringComplete_';

  // write session data
  Future<void> setAccessToken(String? tokenValue) async {
    _storageService.write(accessToken, tokenValue);
  }

  Future<void> setRefreshToken(String? tokenValue) async {
    _storageService.write(refreshToken, tokenValue);
  }

  void setAuthStatus(bool value) {
    _storageService.write(userAuthStatus, value);
  }

  void setOnBoardingComplete(bool value) {
    _storageService.write(isOnBoardingComplete, value);
  }

  // read session data
  Future<String?> getAccessToken() async {
    return _storageService.read(accessToken);
  }

  Future<String?> getRefreshToken() async {
    return _storageService.read(refreshToken);
  }

  Future<bool?> getAuthStatus() async {
    return _storageService.read(userAuthStatus);
  }

  Future<bool?> getOnBoardingComplete() async {
    return _storageService.read(isOnBoardingComplete);
  }
}
