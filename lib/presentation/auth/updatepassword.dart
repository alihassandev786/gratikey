import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/backbutton.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

import '../../data/controllers/passwordcontroller.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final Passwordcontroller controller = Get.find<Passwordcontroller>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
        child: Column(
          children: [
            SizedBox(height: AppSize.heightPercent(0.02)),

            /// BACK BUTTON
            Align(
              alignment: Alignment.centerLeft,
              child: Custombackbutton(),
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// ILLUSTRATION
            Image.asset(
              'assets/images/auth.png',
              height: AppSize.heightPercent(0.30),
              fit: BoxFit.contain,
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// TITLE
            Text(
              "Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.04),
                fontFamily: "pr",
                color: AppColors.textcolor2,
              ),
            ),
            SizedBox(height: AppSize.heightPercent(0.006)),
            Text(
              "Create Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.06),
                fontFamily: "pr",
                fontWeight: FontWeight.w600,
                color: AppColors.textcolor1,
                height: 1.1,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),

            /// NEW PASSWORD
            Obx(
                  () => _buildTextField(
                controller: controller.newPasswordController,
                hint: "New Password",
                isPassword: true,
                isVisible: controller.isNewPasswordVisible.value,
                onToggleVisibility: controller.toggleNewPasswordVisibility,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.01)),

            /// CONFIRM PASSWORD
            Obx(
                  () => _buildTextField(
                controller: controller.confirmNewPasswordController,
                hint: "Confirm Password",
                isPassword: true,
                isVisible: controller.isConfirmNewPasswordVisible.value,
                onToggleVisibility:
                controller.toggleConfirmNewPasswordVisibility,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),

            /// RESET BUTTON
            CustomButton(
              title: "Reset Password",
              onTap: controller.resetPassword,
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Container(
      height: AppSize.heightPercent(0.058),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSize.heightPercent(0.04)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isVisible,
        style: TextStyle(
          fontSize: AppSize.widthPercent(0.038),
          fontFamily: "pr",
          color: AppColors.textcolor1,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: AppSize.widthPercent(0.035),
            fontFamily: "pr",
            color: AppColors.textcolor2.withOpacity(0.6),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSize.widthPercent(0.05),
            vertical: AppSize.heightPercent(0.018),
          ),
          suffixIcon: isPassword
              ? GestureDetector(
            onTap: onToggleVisibility,
            child: Icon(
              isVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.secondary1,
              size: AppSize.widthPercent(0.055),
            ),
          )
              : null,
        ),
      ),
    );
  }
}