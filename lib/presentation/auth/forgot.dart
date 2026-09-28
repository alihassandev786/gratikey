import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/backbutton.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/passwordcontroller.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

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
              'assets/images/auth.png', // apna illustration asset path
              height: AppSize.heightPercent(0.32),
              fit: BoxFit.contain,
            ),
            SizedBox(height: AppSize.heightPercent(0.035)),

            /// TITLE
            Text(
              "Don't Worry",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.04),
                fontFamily: "pr",
                color: AppColors.textcolor2,
              ),
            ),
            SizedBox(height: AppSize.heightPercent(0.006)),
            Text(
              "Forgot Password",
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

            /// EMAIL FIELD
            _buildTextField(
              controller: controller.forgotEmailController,
              hint: "Email Address",
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: AppSize.heightPercent(0.035)),

            /// SEND CODE BUTTON
            CustomButton(
              title: "Send Code",
              onTap: controller.sendCode,
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
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: AppSize.heightPercent(0.058),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSize.heightPercent(0.04)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
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
        ),
      ),
    );
  }
}