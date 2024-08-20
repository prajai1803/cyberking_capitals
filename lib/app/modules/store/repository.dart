import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/payment_post_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';

class StoreRepository {
  final ApiProvider apiProvider;
  StoreRepository({required this.apiProvider});

  final StorageProvider _storageProvider = StorageProvider();

  Future<List<Module>> getStore() async {
    try {
      UserModel userModel = await _storageProvider.readUserModel();
      final res = await apiProvider.getStore(userModel.id);
      List<Module> moduleList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          List list = res.body["data"];
          print(list);
          moduleList = list.map((e) => Module.fromJson(e)).toList();
          return moduleList;
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> makePayment(PaymentPostModel paymentDetails) async {
    try {
      final res = await apiProvider.createPayment(paymentDetails);

      if (res != null) {
        if (res.statusCode == 200) {
          final status = res.body["success"];
          return status;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
