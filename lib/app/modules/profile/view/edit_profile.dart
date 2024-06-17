import 'package:cyberking_capitals/app/core/values/icons.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/profile/controller/edit_profile_controller.dart';
import 'package:cyberking_capitals/app/modules/profile/widgets/text_field.dart';
import 'package:cyberking_capitals/app/widgets/cached_network_image.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final _controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil().screenHeight;
    return Scaffold(
        backgroundColor: const Color(0xeFF5F6FB),
        appBar: AppBar(title: const Text("Your Profile")),
        body: SingleChildScrollView(
          child: GetBuilder(
            init: _controller,
            id: "Main Screen",
            initState: (_) {},
            builder: (_) {
              return Column(
                children: [
                  SizedBox(
                    height: screenHeight * .91,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        _buildForm(screenHeight, context),
                        _buildProfilePicture(),
                        Positioned(
                          top: 90.h,
                          left: 200.w,
                          child: InkWell(
                            onTap: () {
                              _buildBottomSheet(context);
                            },
                            child: Image.asset(
                              AppImages.camera,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }

  GetBuilder<EditProfileController> _buildProfilePicture() {
    return GetBuilder(
      init: _controller,
      id: "Profile Picture",
      initState: (_) {},
      builder: (_) {
        return Positioned(
          child: _controller.selectedProfileImageFile == null
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 62.r,
                  child: CircleCachedImage(
                    imageUrl: _controller.currentUser?.profilePhoto ??
                        AppNetworkIcons.userIcon,
                    radius: 50.r,
                  ),
                )
              : CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 62.r,
                  backgroundImage:
                      FileImage(_controller.selectedProfileImageFile!),
                ),
        );
      },
    );
  }

  void _buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r))),
      builder: (context) => Container(
        height: 150.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Profile Photo",
            style: TextStyle(
              fontSize: 18.h,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          const Divider(thickness: 1),
          SizedBox(height: 8.h),
          Row(
            children: [
              InkWell(
                onTap: () {
                  _controller.selectProfilePictureViaCamera();
                },
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                    size: 24.r,
                  ),
                ),
              ),
              SizedBox(width: 24.w),
              InkWell(
                onTap: () {
                  _controller.selectProfilePictureViaGallery();
                },
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.photo_outlined,
                    color: Colors.black,
                    size: 24.r,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Form _buildForm(double screenHeight, BuildContext context) {
    return Form(
      key: _controller.profileFormKey,
      child: Column(
        children: [
          Container(height: 70.h),
          Container(
            height: screenHeight * .82,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Container(height: 80.h),
                  ProfileTextFormField(
                      labeltext: "Name",
                      readOnly: true,
                      controller: _controller.nameController),
                  SizedBox(height: 24.h),
                  ProfileTextFormField(
                      labeltext: "Contact Number",
                      keyboardType: TextInputType.number,
                      controller: _controller.contactController),
                  SizedBox(height: 24.h),
                  GetBuilder(
                    init: _controller,
                    id: "Whatsapp Field",
                    initState: (_) {},
                    builder: (_) {
                      return Column(
                        children: [
                          ProfileTextFormField(
                              labeltext: "Whatsapp Number",
                              readOnly: _controller.isWhatsappSameAsContact,
                              keyboardType: TextInputType.number,
                              controller: _controller.whatappController),
                          Row(
                            children: [
                              Checkbox(
                                  value: _controller.isWhatsappSameAsContact,
                                  onChanged: (v) {
                                    _controller.updateWhatsappSameContent();
                                  }),
                              Text(
                                "Same as a contact number",
                                style: TextStyle(
                                    fontSize: 8.h, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  ProfileTextFormField(
                      labeltext: "Email",
                      readOnly: true,
                      controller: _controller.emailController),
                  SizedBox(height: 24.h),
                  ProfileTextFormField(
                      labeltext: "DOB",
                      readOnly: true,
                      onTap: () {
                        _controller.selectDate(context);
                      },
                      controller: _controller.dobController),
                  SizedBox(height: 24.h),
                  ProfileTextFormField(
                      labeltext: "Location",
                      controller: _controller.locationController),
                  SizedBox(height: 24.h),
                  const Spacer(),
                  GetBuilder(
                    init: _controller,
                    id: "Update Button",
                    initState: (_) {},
                    builder: (_) {
                      return _controller.isUpdating
                          ? const CircularProgressIndicator()
                          : AppElevatedButton(
                              text: "UPDATE PROFILE",
                              onPressed: () => _controller.updateProfile(),
                            );
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
