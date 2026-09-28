import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/backbutton.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

import '../../data/controllers/passwordcontroller.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

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
              "Verification",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.04),
                fontFamily: "pr",
                color: AppColors.textcolor2,
              ),
            ),
            SizedBox(height: AppSize.heightPercent(0.006)),
            Text(
              "Verify Email",
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

            /// OTP BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: AppSize.widthPercent(0.13),
                  height: AppSize.heightPercent(0.065),
                  child: TextField(
                    controller: controller.otpControllers[index],
                    focusNode: controller.otpFocusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.05),
                      fontFamily: "pr",
                      fontWeight: FontWeight.w600,
                      color: AppColors.textcolor1,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSize.heightPercent(0.02),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (value) =>
                        controller.onOtpChanged(value, index),
                  ),
                );
              }),
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// RESEND
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive any code? ",
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.034),
                    fontFamily: "pr",
                    color: AppColors.textcolor2,
                  ),
                ),
                GestureDetector(
                  onTap: controller.resendCode,
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.034),
                      fontFamily: "pr",
                      color: AppColors.secondary1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),

            /// CONTINUE BUTTON
            CustomButton(
              title: "Continue",
              onTap: controller.verifyCode,
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),
          ],
        ),
      ),
    );
  }
}