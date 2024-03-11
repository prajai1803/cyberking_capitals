import 'package:cyberking_capitals/app/data/services/storage/service.dart';

class SessionDB extends StorageService {
  final StorageService _storageService = StorageService();

  static const token = '_token_';
  static const userAuthStatus = '_authStatus_';

  // write session data
  Future<void> setToken(String? tokenValue) async {
    _storageService.write(token, tokenValue);
  }

  void setAuthStatus(bool value) {
    _storageService.write(userAuthStatus, value);
  }

  // read session data
  Future<String?> getToken() async {
    return _storageService.read(token);
  }

  Future<bool?> getAuthStatus() async {
    return _storageService.read(userAuthStatus);
  }
}
