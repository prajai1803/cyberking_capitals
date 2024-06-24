import 'package:cyberking_capitals/app/data/services/storage/service.dart';

class SessionDB extends StorageService {
  final StorageService _storageService = StorageService();

  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const userAuthStatus = '_authStatus_';
  static const isOnBoardingComplete = '_isOnBoaringComplete_';
  static const isIntroVideoComplete = '_isIntroVideoComplete_';
  static const spikUpdate = '_isIntroVideoComplete_';

  // write session data
  Future<void> setAccessToken(String? tokenValue) async {
    _storageService.write(accessToken, tokenValue);
  }

  Future<void> setRefreshToken(String? tokenValue) async {
    _storageService.write(refreshToken, tokenValue);
  }

  Future<void> setAuthStatus(bool value) async {
    _storageService.write(userAuthStatus, value);
  }

  Future<void> setOnBoardingComplete(bool value) async {
    _storageService.write(isOnBoardingComplete, value);
  }

  Future<void> setIntroVideoComplete(bool value) async {
    _storageService.write(isIntroVideoComplete, value);
  }

  Future<void> setSkipUpdate(bool value) async {
    _storageService.write(isIntroVideoComplete, value);
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

  Future<bool?> getIntroVideoCompleteStatus() async {
    return _storageService.read(isIntroVideoComplete);
  }

  Future<bool?> getSkipUpdate() async {
    return _storageService.read(isIntroVideoComplete);
  }
}
