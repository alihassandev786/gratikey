import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/authcontroller.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
        child: Column(
          children: [
            SizedBox(height: AppSize.heightPercent(0.065)),

            /// LOGO
            Image.asset(
              'assets/images/logo.png',
              height: AppSize.heightPercent(0.08),
              fit: BoxFit.contain,
            ),

            SizedBox(height: AppSize.heightPercent(0.05)),

            /// WELCOME TEXT
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.04),
                fontFamily: "pr",
                color: AppColors.textcolor2,
              ),
            ),
            SizedBox(height: AppSize.heightPercent(0.007)),
            Text(
              "Create Your Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.062),
                fontFamily: "pr",
                fontWeight: FontWeight.w600,
                color: AppColors.textcolor1,
                height: 1.1,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.045)),

            /// USER NAME
            _buildTextField(
              controller: controller.userNameController,
              hint: "User Name",
            ),

            SizedBox(height: AppSize.heightPercent(0.01)),

            /// EMAIL
            _buildTextField(
              controller: controller.signUpEmailController,
              hint: "Email Address",
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: AppSize.heightPercent(0.01)),

            /// CREATE PASSWORD
            Obx(
                  () => _buildTextField(
                controller: controller.createPasswordController,
                hint: "Create Password",
                isPassword: true,
                isVisible: controller.isCreatePasswordVisible.value,
                onToggleVisibility: controller.toggleCreatePasswordVisibility,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.01)),

            /// CONFIRM PASSWORD
            Obx(
                  () => _buildTextField(
                controller: controller.confirmPasswordController,
                hint: "Confirm Password",
                isPassword: true,
                isVisible: controller.isConfirmPasswordVisible.value,
                onToggleVisibility: controller.toggleConfirmPasswordVisibility,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// AGREE TERMS
            GestureDetector(
              onTap: controller.toggleAgreeTerms,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                        () => Container(
                      width: AppSize.widthPercent(0.055),
                      height: AppSize.widthPercent(0.055),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: controller.agreeTerms.value
                            ? const LinearGradient(
                          colors: [
                            AppColors.primary1,
                            AppColors.primary2,
                          ],
                        )
                            : null,
                        border: controller.agreeTerms.value
                            ? null
                            : Border.all(
                          color: AppColors.primary2.withOpacity(0.6),
                          width: 1.5,
                        ),
                      ),
                      child: controller.agreeTerms.value
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: AppSize.widthPercent(0.035),
                      )
                          : null,
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.025)),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: AppSize.widthPercent(0.03),
                          fontFamily: "pr",
                          color: AppColors.textcolor2,
                        ),
                        children: [
                          const TextSpan(text: "I agree with "),
                          TextSpan(
                            text: "terms & conditions",
                            style: TextStyle(
                              color: AppColors.secondary1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const TextSpan(text: " & "),
                          TextSpan(
                            text: "privacy policy",
                            style: TextStyle(
                              color: AppColors.secondary1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.035)),

            /// SIGN UP BUTTON
            CustomButton(
              title: "Sign Up",
              onTap: controller.signUp,
            ),

            SizedBox(height: AppSize.heightPercent(0.035)),

            /// CONTINUE WITH
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.textcolor2.withOpacity(0.25),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.widthPercent(0.04),
                  ),
                  child: Text(
                    "Continue with",
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.034),
                      fontFamily: "pr",
                      color: AppColors.textcolor2,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.textcolor2.withOpacity(0.25),
                    thickness: 1,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.heightPercent(0.028)),

            /// SOCIAL BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialButton(
                  color: Colors.white,
                  icon: Icons.g_mobiledata,
                  iconColor: const Color(0xFFDB4437),
                  border: true,
                  onTap: controller.continueWithGoogle,
                ),
                SizedBox(width: AppSize.widthPercent(0.04)),
                _socialButton(
                  color: Colors.black,
                  icon: Icons.apple,
                  onTap: controller.continueWithApple,
                ),
              ],
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// BOTTOM LINK
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.035),
                    fontFamily: "pr",
                    color: AppColors.textcolor2,
                  ),
                ),
                GestureDetector(
                  onTap: controller.goToSignIn,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.035),
                      fontFamily: "pr",
                      color: AppColors.secondary1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.heightPercent(0.035)),
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
        obscureText: isPassword && !isVisible,
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
            vertical: AppSize.heightPercent(0.017),
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

  Widget _socialButton({
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
    bool border = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.widthPercent(0.11),
        height: AppSize.widthPercent(0.11),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: border
              ? Border.all(color: Colors.grey.shade300, width: 1)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: AppSize.widthPercent(0.065),
        ),
      ),
    );
  }
}