import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class StorageService extends GetxService{
  final GetStorage _box = GetStorage();

  T read<T> (String key) {
    return _box.read(key);
  }

  void write(String key,dynamic value) async {
    await _box.write(key, value);
  }
}