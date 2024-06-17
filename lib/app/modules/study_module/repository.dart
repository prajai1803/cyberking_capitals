import 'package:cyberking_capitals/app/data/models/certificate_model.dart';
import 'package:cyberking_capitals/app/data/models/module_record.dart';
import 'package:cyberking_capitals/app/data/models/session_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';

class StudyRepository {
  final ApiProvider apiProvider;
  StudyRepository({required this.apiProvider});

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

  Future<CertificateModel?> getCertificate(
      int? studentId, int? moduleId) async {
    try {
      final res = await apiProvider.getCerficate(studentId, moduleId);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          final decodedBody = resBody["data"];

          return CertificateModel.fromJson(decodedBody);
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<ModuleRecordModel?> getModuleRecord(
      int? studentId, int? moduleId) async {
    try {
      final res = await apiProvider.getModuleRecord(studentId, moduleId);

      if (res != null) {
        if (res.statusCode == 200) {
          final jsonDecoded = res.body["data"] as Map<String, dynamic>;
          ModuleRecordModel moduleRecordModel =
              ModuleRecordModel.fromJson(jsonDecoded);
          return moduleRecordModel;
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
