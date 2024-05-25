import 'dart:convert';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';

import '../models/user_model.dart';
import '../services/storage/service.dart';

class StorageProvider {
  final StorageService _storageService = StorageService();

  Future<void> writeUserModel(UserModel user) async {
    _storageService.write('user', jsonEncode(user));
  }

  Future<void> writeHomeQueries(List<ModuleSessionModel> homeQueries) async {
    _storageService.write('homeQueries', jsonEncode(homeQueries));
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

  Future<List<ModuleSessionModel>> readHomeQueries() async {
    final data = _storageService.read('homeQueries');
    if (data == null) {
      return [];
    } else {
      List<ModuleSessionModel> temp = [];
      final decodedList = jsonDecode(data) as List;

      for (var element in decodedList) {
        temp.add(ModuleSessionModel.fromJson(element));
      }
      return temp;
    }
  }
}
