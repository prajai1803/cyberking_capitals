import 'dart:io';
import 'dart:typed_data';

import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/certificate_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/study_module/repository.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CertificateController extends GetxController {
  final StudyRepository _repository =
      StudyRepository(apiProvider: ApiProvider());
  final _storageProvider = StorageProvider();

  CertificateModel? certificateModel;

  late final ScreenshotController screenshotController;

  ScreenState screenState = ScreenState.loading;
  void setScreenState(ScreenState state) {
    screenState = state;
    update(["Main Screen"]);
  }

  @override
  void onInit() {
    screenshotController = ScreenshotController();
    fetchCertificateData();
    super.onInit();
  }

  void downloadCertificate() async {
    _requestPermissions();

    printInfo(info: "dsf");
    final Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes != null) {
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        // String newPath = "";
        // List<String> folders = directory.path.split("/");
        // for (int x = 1; x < folders.length; x++) {
        //   String folder = folders[x];
        //   if (folder != "Android") {
        //     newPath += "/$folder";
        //   } else {
        //     break;
        //   }
        // }
        // newPath = newPath + "/StudentApp";
        // final d = Directory(newPath);
        // print(d);

        final pathOfImage =
            await File('${directory.path}/certifcate-${DateTime.now()}.jpg')
                .create();
        await pathOfImage.writeAsBytes(imageBytes);
        ImageGallerySaver.saveFile(pathOfImage.path);
        CommonAlerts.showSuccessSnack(message: "File Downloaded");
        OpenFile.open(pathOfImage.path);
        return;
      }
    } else {
      await Permission.storage.request();
    }
  }

  void shareCertificate() async {
    final Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes != null) {
      final directory = await getApplicationDocumentsDirectory();
      final pathOfImage =
          await File('${directory.path}/certifcate-${DateTime.now()}.jpg')
              .create();
      await pathOfImage.writeAsBytes(imageBytes);
      await Share.shareXFiles([XFile(pathOfImage.path)]);
    }
  }

  void fetchCertificateData() async {
    try {
      setScreenState(ScreenState.loading);
      final user = await _storageProvider.readUserModel();
      final moduleId = Get.arguments as int;
      certificateModel = await _repository.getCertificate(user.id, moduleId);
      setScreenState(ScreenState.loaded);
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
      setScreenState(ScreenState.error);
    }
  }

  Future<void> _requestPermissions() async {
    // if (await Permission.storage.request().isGranted) {
    //   // The old storage permission is granted
    //   return;
    // }

    // if (await Permission.manageExternalStorage.request().isGranted) {
    //   // Manage External Storage permission is granted
    //   return;
    // }

    Map<Permission, PermissionStatus> statuses;
    if (await Permission.photos.status.isGranted ||
        await Permission.videos.status.isGranted ||
        await Permission.audio.status.isGranted) {
      // Specific media permissions are granted
      return;
    } else {
      // Request specific media permissions
      statuses = await [
        Permission.photos,
        Permission.videos,
        Permission.audio,
      ].request();
    }

    if (statuses.values.any((status) => status.isDenied)) {
      // Handle the denied permissions here
    }
  }
}
