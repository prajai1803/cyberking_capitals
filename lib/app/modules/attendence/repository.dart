import 'package:cyberking_capitals/app/data/models/attendance_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';

class AttendanceRepository {
  final ApiProvider apiProvider;
  AttendanceRepository(this.apiProvider);

  Future<List<AttendanceModel>> getAttendanceHistory(
      int? studentId, String startDate, String endDate) async {
    try {
      final res = await apiProvider.getAttendanceStudentHistory(
          studentId, startDate, endDate);
      List<AttendanceModel> attendanceList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          List list = res.body["data"];
          attendanceList =
              list.map((e) => AttendanceModel.fromJson(e)).toList();
          return attendanceList;
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
