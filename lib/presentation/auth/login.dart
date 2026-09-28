import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/authcontroller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
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
              "Please, Sign In",
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

            /// EMAIL FIELD
            _buildTextField(
              controller: controller.emailController,
              hint: "Email Address",
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: AppSize.heightPercent(0.01)),

            /// PASSWORD FIELD
            Obx(
                  () => _buildTextField(
                controller: controller.passwordController,
                hint: "Password",
                isPassword: true,
                isVisible: controller.isPasswordVisible.value,
                onToggleVisibility: controller.togglePasswordVisibility,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// REMEMBER ME + FORGOT PASSWORD
            Row(
              children: [
                GestureDetector(
                  onTap: controller.toggleRememberMe,
                  child: Row(
                    children: [
                      Obx(
                            () => Container(
                          width: AppSize.widthPercent(0.055),
                          height: AppSize.widthPercent(0.055),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: controller.rememberMe.value
                                ? const LinearGradient(
                              colors: [
                                AppColors.primary1,
                                AppColors.primary2,
                              ],
                            )
                                : null,
                            border: controller.rememberMe.value
                                ? null
                                : Border.all(
                              color: AppColors.primary2.withOpacity(0.6),
                              width: 1.5,
                            ),
                          ),
                          child: controller.rememberMe.value
                              ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: AppSize.widthPercent(0.035),
                          )
                              : null,
                        ),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.02)),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          fontSize: AppSize.widthPercent(0.035),
                          fontFamily: "pr",
                          color: AppColors.textcolor2,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: controller.goToForgotPassword,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.035),
                      fontFamily: "pr",
                      color: AppColors.secondary1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.heightPercent(0.05)),

            /// SIGN IN BUTTON
            CustomButton(
              title: "Sign In",
              onTap: controller.signIn,
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),

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

            SizedBox(height: AppSize.heightPercent(0.03)),

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

            SizedBox(height: AppSize.heightPercent(0.045)),

            /// BOTTOM LINK
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't have an account? ",
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.035),
                    fontFamily: "pr",
                    color: AppColors.textcolor2,
                  ),
                ),
                GestureDetector(
                  onTap: controller.goToSignUp,
                  child: Text(
                    "Sign Up",
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