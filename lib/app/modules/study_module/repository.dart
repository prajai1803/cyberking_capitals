import 'package:cyberking_capitals/app/data/models/session_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';

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
}
