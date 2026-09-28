import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/data/controllers/bottomnavigationcontroller.dart';
import 'package:gratikey/presentation/auth/forgot.dart';
import 'package:gratikey/presentation/auth/login.dart';
import 'package:gratikey/presentation/auth/policy.dart';
import 'package:gratikey/presentation/auth/signup.dart';
import 'package:gratikey/presentation/auth/terms.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';

class AuthController extends GetxController {
  // ---------------- SIGN IN ----------------
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var rememberMe = true.obs;

  // ---------------- SIGN UP ----------------
  final userNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isCreatePasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var agreeTerms = true.obs;

  // ---------------- TOGGLES ----------------
  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  void toggleCreatePasswordVisibility() =>
      isCreatePasswordVisible.value = !isCreatePasswordVisible.value;

  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

  void toggleRememberMe() => rememberMe.value = !rememberMe.value;

  void toggleAgreeTerms() => agreeTerms.value = !agreeTerms.value;

  // ---------------- ACTIONS ----------------
  void signIn() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.find<BottomNavController>().changeTab(0);
    AppNavigator.push(BottomNavigationScreen());
  }

  void signUp() {
    FocusManager.instance.primaryFocus?.unfocus();
    AppNavigator.push(BottomNavigationScreen());
  }

  void goToForgotPassword() {
    AppNavigator.push(ForgotScreen());
  }

  void goToSignUp() {
    AppNavigator.push(SignUpScreen());
  }

  void goToSignIn() {
    AppNavigator.push(LoginScreen());
  }

  void goToTerms() {
    AppNavigator.push(TermsAndConditions());
  }
  void goToPrivacyPolicy() {
    AppNavigator.push(PrivacyPolicy());
  }

  void continueWithFacebook() {}
  void continueWithTwitter() {}
  void continueWithGoogle() {}
  void continueWithApple() {}

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    signUpEmailController.dispose();
    createPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}