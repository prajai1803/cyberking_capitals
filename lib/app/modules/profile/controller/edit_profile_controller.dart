import 'dart:io';

import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController contactController;
  late final TextEditingController whatappController;
  late final TextEditingController emailController;
  late final TextEditingController dobController;
  late final TextEditingController locationController;
  bool isWhatsappSameAsContact = false;
  File? selectedProfileImageFile;

  final ImagePicker _imagePicker = ImagePicker();

  UserModel userModel = Get.arguments as UserModel;

  @override
  void onInit() {
    _initTextEditingControler();
    _checkWhatsappCheckBox();
    super.onInit();
  }

  @override
  void dispose() {
    _disposeTextEditingController();
    super.dispose();
  }

  void _initTextEditingControler() {
    nameController = TextEditingController();
    contactController = TextEditingController();
    whatappController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    locationController = TextEditingController();

    nameController.text = userModel.fullName ?? "";
    emailController.text = userModel.email ?? "";
    // contactController.text usermo
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
      lastDate: DateTime(2200),
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      dobController.text = formattedDate;
    } else {
      CommonAlerts.showErrorSnack(message: "Date is not selected");
    }
  }

  void updateProfile() {
    if (profileFormKey.currentState!.validate()) {}
  }
}
