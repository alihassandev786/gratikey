import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/imagepicker.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/profile_header.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/soft_input_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return AppBackground(
      child: SingleChildScrollView(
        
        padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.height * 0.01),

            /// HEADER
            ProfileHeader(
              coverImage: controller.coverImage,
              profileImage: controller.profileImage,
              isEditMode: true,
              onCameraTap: () {
                ImagePickerBottomSheet.show(
                  onCameraTap: () {
                    // TODO: pick from camera
                  },
                  onGalleryTap: () {
                    // TODO: pick from gallery
                  },
                );
              },
              height: AppSize.height * 0.34,
              coverHeight: AppSize.height * 0.28,
            ),
            SizedBox(height: AppSize.height * 0.015),

            Text(
              "Change Profile Picture",
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.width * 0.032,
                color: AppColors.textcolor2,
              ),
            ),

            SizedBox(height: AppSize.height * 0.04),

            SoftInputField(
              controller: controller.usernameController,
              hint: "Username",
              suffixIcon: Icons.edit_rounded,
              height: AppSize.height*0.078,
              fontfamily: "pm",
              hintfontfamily: "pm",
              backgroundcolor: AppColors.secondary3,
            ),

            SizedBox(height: AppSize.height * 0.01),

            SoftInputField(
              controller: controller.emailController,
              fontfamily: "pm",
              hintfontfamily: "pm",
              hint: "Email Address",
              height: AppSize.height*0.078,
              backgroundcolor: AppColors.secondary3,
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icons.edit_rounded,
            ),

            SizedBox(height: AppSize.height * 0.05),

            CustomButton(
              title: "Save Changes",
              onTap: controller.saveProfileChanges,
            ),

            SizedBox(height: AppSize.height * 0.04),
          ],
        ),
      ),
    );
  }
}
