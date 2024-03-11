import 'dart:convert';

import '../models/user_model.dart';
import '../services/storage/service.dart';

class StorageProvider {
  final StorageService _storageService = StorageService();

  Future<void> writeUserModel(UserModel user) async {
    _storageService.write('user', jsonEncode(user));
  }

  Future<UserModel> readUserModel() async {
    final data = _storageService.read('user');
    if (data == null) {
      return UserModel();
    } else {
      UserModel user = UserModel.fromJson(jsonDecode(data));
      return user;
    }
  }
}
