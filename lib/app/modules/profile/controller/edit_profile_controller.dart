import 'dart:io';

import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/profile/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final _repository = ProfileRepository(apiProvider: ApiProvider());

  final StorageProvider _storageProvider = StorageProvider();

  late final TextEditingController nameController;
  late final TextEditingController contactController;
  late final TextEditingController whatappController;
  late final TextEditingController emailController;
  late final TextEditingController dobController;
  late final TextEditingController locationController;
  bool isWhatsappSameAsContact = false;
  File? selectedProfileImageFile;

  final ImagePicker _imagePicker = ImagePicker();

  UserModel? currentUser;

  bool isUpdating = false;
  void setIsUpdating(value) {
    isUpdating = value;
    update(["Update Button"]);
  }

  @override
  void onInit() async {
    _initTextEditingControler();

    _checkWhatsappCheckBox();
    update(["Main Screen"]);

    super.onInit();
  }

  @override
  void dispose() {
    _disposeTextEditingController();
    super.dispose();
  }

  void _intilizerControllerData() async {
    currentUser = await _storageProvider.readUserModel();
    if (currentUser != null) {
      nameController.text = currentUser?.name ?? "";
      contactController.text = currentUser?.mobileNumber ?? "";
      whatappController.text = currentUser?.whatsappNumber ?? "";
      emailController.text = currentUser?.email ?? "";
      dobController.text = currentUser?.dateOfBirth == null
          ? ""
          : DateFormat("dd MMM yyyy").format(currentUser!.dateOfBirth!);
      locationController.text = currentUser?.location ?? "";
    }
  }

  void _initTextEditingControler() {
    nameController = TextEditingController();
    contactController = TextEditingController();
    whatappController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    locationController = TextEditingController();

    _intilizerControllerData();
  }

  void _disposeTextEditingController() {
    nameController.dispose();
    contactController.dispose();
    whatappController.dispose();
    emailController.dispose();
    dobController.dispose();
    locationController.dispose();
  }

  void _checkWhatsappCheckBox() {
    if (whatappController.text.isNotEmpty &&
        whatappController.text == contactController.text) {
      isWhatsappSameAsContact = true;
      update(["Whatsapp Field"]);
    }
  }

  void updateWhatsappSameContent() {
    isWhatsappSameAsContact = !isWhatsappSameAsContact;
    if (whatappController.text != contactController.text) {
      whatappController.text = contactController.text;
    }
    update(["Whatsapp Field"]);
  }

  Future<void> updateProfile() async {
    try {
      setIsUpdating(true);
      UserModel? user = currentUser!.copyWith(
        dateOfBirth: DateFormat('dd MMM yyyy').tryParse(dobController.text),
        name: nameController.text,
        mobileNumber: contactController.text,
        whatsappNumber: whatappController.text,
        location: locationController.text,
      );
      user =
          await _repository.updateProfileData(user, selectedProfileImageFile);
      if (user != null) {
        _storageProvider.writeUserModel(user);
        Get.back();
        CommonAlerts.showSuccessSnack(message: "Profile Update Successfully");
      }
      if (true) setIsUpdating(false);
    } on ApiStatusException catch (e) {
      setIsUpdating(false);
      CommonAlerts.showErrorSnack(message: e.message);
    } catch (e) {
      setIsUpdating(false);
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }

  void selectProfilePictureViaCamera() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        selectedProfileImageFile = File(image.path);
        Get.back();
        update(["Profile Picture"]);
      }
    } on PlatformException catch (e) {
      selectedProfileImageFile = null;
      update(["Profile Picture"]);
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }

  void selectProfilePictureViaGallery() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedProfileImageFile = File(image.path);
        Get.back();
        update(["Profile Picture"]);
      }
    } on PlatformException catch (e) {
      selectedProfileImageFile = null;

      update(["Profile Picture"]);
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }

  selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      dobController.text = formattedDate;
    } else {
      CommonAlerts.showErrorSnack(message: "Date is not selected");
    }
  }
}
