import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/backbutton.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/soft_input_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return AppBackground(
      child: SingleChildScrollView(
        
        padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.06),
        child: Column(
          children: [
            SizedBox(height: AppSize.height * 0.015),

            const Align(
              alignment: Alignment.centerLeft,
              child: Custombackbutton(),
            ),

            SizedBox(height: AppSize.height * 0.02),

            Image.asset(
              'assets/images/auth.png',
              height: AppSize.height * 0.28,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.lock_rounded,
                size: AppSize.width * 0.25,
                color: AppColors.primary1.withOpacity(0.5),
              ),
            ),

            SizedBox(height: AppSize.height * 0.02),

            Text(
              "Password",
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.width * 0.038,
                color: AppColors.textcolor2,
              ),
            ),
            SizedBox(height: AppSize.height * 0.006),
            Text(
              "Change Password",
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.width * 0.055,
                color: AppColors.textcolor1,
              ),
            ),

            SizedBox(height: AppSize.height * 0.04),

            Obx(
              () => SoftInputField(
                controller: controller.currentPasswordController,
                hint: "Current Password",
                obscureText: !controller.isCurrentPasswordVisible.value,
                suffixIcon: controller.isCurrentPasswordVisible.value
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                onSuffixTap: controller.toggleCurrentPasswordVisibility,
              ),
            ),
            SizedBox(height: AppSize.height * 0.011),

            Obx(
              () => SoftInputField(
                controller: controller.newPasswordController,
                hint: "New Password",
                obscureText: !controller.isNewPasswordVisible.value,
                suffixIcon: controller.isNewPasswordVisible.value
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                onSuffixTap: controller.toggleNewPasswordVisibility,
              ),
            ),
            SizedBox(height: AppSize.height * 0.011),

            Obx(
              () => SoftInputField(
                controller: controller.confirmPasswordController,
                hint: "Confirm Password",
                obscureText: !controller.isConfirmPasswordVisible.value,
                suffixIcon: controller.isConfirmPasswordVisible.value
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                onSuffixTap: controller.toggleConfirmPasswordVisibility,
              ),
            ),

            SizedBox(height: AppSize.height * 0.042),

            CustomButton(
              title: "Update Password",
              onTap: controller.updatePassword,
            ),

            SizedBox(height: AppSize.height * 0.04),
          ],
        ),
      ),
    );
  }
}
