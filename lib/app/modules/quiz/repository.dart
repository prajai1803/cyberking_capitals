import 'package:cyberking_capitals/app/data/models/question_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';

class QuizRepository {
  final ApiProvider apiProvider;
  const QuizRepository(this.apiProvider);

  Future<List<QuestionModel>> getQuizByModuleId(int id) async {
    try {
      final res = await apiProvider.getQuiz(id);
      List<QuestionModel> questionList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          List list = res.body["data"];
          questionList = list.map((e) => QuestionModel.fromJson(e)).toList();
          return questionList;
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> submitQuiz(int? studentId, int? moduleId, int? quiz) async {
    try {
      final res = await apiProvider.submitQuiz(
        studentId,
        quiz,
        moduleId,
      );
      if (res != null) {
        if (res.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
