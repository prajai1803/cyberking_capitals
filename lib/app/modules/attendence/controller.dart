import 'package:cyberking_capitals/app/data/models/attendance_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'repository.dart';

class AttendanceController extends GetxController {
  /* --------------------------------------
  ------------ Properties ------------------
  ----------------------------------------*/
  final _repository = AttendanceRepository(ApiProvider());

  List<AttendanceModel> attendanceList = [];

  /* --------------------------------------
  ----------------- States ---------------
  ----------------------------------------*/

  bool isScreenLoading = false;
  void setScreenLoading(value) {
    isScreenLoading = value;
    update(["Attendance Screen"]);
  }

  /* --------------------------------------
  ----------- Widget Life Cycle ----------
  ----------------------------------------*/

  @override
  void onInit() {
    fetchInitialData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /* --------------------------------------
  ----------------- Methods ---------------
  ----------------------------------------*/
  fetchInitialData() async {
    try {
      setScreenLoading(true);
      // get 1st data of month and today
      DateTime now = DateTime.now();
      DateTime currntMonth = DateTime(now.year, now.month, 1);
      final currntMonthFormatted = DateFormat("yyyy-MM-dd").format(currntMonth);
      final currentDayOfMonth = DateFormat("yyyy-MM-dd").format(now);

      // to get student id
      final user = await StorageProvider().readUserModel();

      attendanceList = await _repository.getAttendanceHistory(
          user.id, currntMonthFormatted, currentDayOfMonth);
      setScreenLoading(false);
    } on ApiStatusException catch (e) {
      CommonAlerts.showSuccessSnack(message: e.message);
      setScreenLoading(false);
    } catch (e) {
      CommonAlerts.showSuccessSnack(message: e.toString());
      setScreenLoading(false);
    }
  }
}
