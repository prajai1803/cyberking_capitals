import 'package:cyberking_capitals/app/data/models/intro_video_model.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/progressbar_model.dart';
import 'package:cyberking_capitals/app/data/models/session_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';

class HomeRepository {
  final ApiProvider apiProvider;
  HomeRepository({required this.apiProvider});

  final StorageProvider _storageProvider = StorageProvider();

  Future<List<ModuleSessionModel>> getHomeQueries(int? studentId) async {
    try {
      final res = await apiProvider.getHomeQueries(studentId);
      List<ModuleSessionModel> moduleList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          List list = res.body["data"];
          moduleList = list.map((e) => ModuleSessionModel.fromJson(e)).toList();
          _storageProvider.writeHomeQueries(moduleList);
          return moduleList;
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> submitAttendance(int? batchId) async {
    try {
      final res = await apiProvider.submitAttendance(batchId);
      if (res != null) {
        if (res.statusCode == 200) {
          return true;
        } else {
          throw ApiStatusException(message: res.body["message"]);
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SessionModel>> getSessionByModuleId(int id) async {
    try {
      final res = await apiProvider.getSessionByModuleId(id);
      List<SessionModel> sessionList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          List list = res.body["data"];
          sessionList = list.map((e) => SessionModel.fromJson(e)).toList();
          return sessionList;
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<ProgressBarModel?> getProgressBar(int id) async {
    try {
      final res = await apiProvider.getProgressBar(id);

      if (res != null) {
        if (res.statusCode == 200) {
          final jsonBody = res.body["data"];
          ProgressBarModel progressBarModel =
              ProgressBarModel.fromJson(jsonBody);
          return progressBarModel;
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<IntroVideoModel?> getIntroVideo() async {
    try {
      final res = await apiProvider.getIntroVideo();
      if (res != null) {
        List<IntroVideoModel> introVideoList = [];
        List videoDetails = res.body["videoDetails"];
        List<IntroVideoModel> videoDetailsList =
            videoDetails.map((e) => IntroVideoModel.fromJson(e)).toList();
        introVideoList = videoDetailsList
            .where((element) => element.isPublished == 1)
            .toList();
        if (introVideoList.isEmpty) {
          return null;
        }
        return introVideoList.last;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<SessionModel>> submitSession(
      int? studentId, int? sessionId) async {
    try {
      final res = await apiProvider.submitSession(
        studentId,
        sessionId,
      );
      List<SessionModel> sessionList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          List list = res.body["data"];
          sessionList = list.map((e) => SessionModel.fromJson(e)).toList();
          return sessionList;
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
