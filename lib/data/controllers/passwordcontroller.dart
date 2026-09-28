import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/presentation/auth/login.dart';

import '../../presentation/auth/forgot.dart';
import '../../presentation/auth/updatepassword.dart';
import '../../presentation/auth/updatesuccess.dart';
import '../../presentation/auth/verify.dart';

class Passwordcontroller extends GetxController {
  // ==================== SIGN IN ====================
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var rememberMe = true.obs;

  // ==================== SIGN UP ====================
  final userNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isCreatePasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var agreeTerms = true.obs;

  // ==================== FORGOT / RESET FLOW ====================
  final forgotEmailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  var isNewPasswordVisible = false.obs;
  var isConfirmNewPasswordVisible = false.obs;

  // OTP
  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  // ==================== TOGGLES ====================
  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  void toggleCreatePasswordVisibility() =>
      isCreatePasswordVisible.value = !isCreatePasswordVisible.value;

  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

  void toggleNewPasswordVisibility() =>
      isNewPasswordVisible.value = !isNewPasswordVisible.value;

  void toggleConfirmNewPasswordVisibility() =>
      isConfirmNewPasswordVisible.value = !isConfirmNewPasswordVisible.value;

  void toggleRememberMe() => rememberMe.value = !rememberMe.value;
  void toggleAgreeTerms() => agreeTerms.value = !agreeTerms.value;

  // ==================== ACTIONS ====================
  void signIn() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API
  }

  void signUp() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API
  }

  void sendCode() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API - send OTP
    AppNavigator.push(VerifyScreen());
  }

  void resendCode() {
    // TODO: API - resend OTP
  }

  void verifyCode() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API - verify OTP
    AppNavigator.push(UpdatePasswordScreen());
  }

  void resetPassword() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API - reset password
    AppNavigator.push(UpdateSuccessScreen());
  }

  void goToSignIn() {
    AppNavigator.push(LoginScreen());
  }

  void goToLoginFromSuccess() {
    AppNavigator.clear(LoginScreen());
  }

  void continueWithFacebook() {}
  void continueWithTwitter() {}
  void continueWithGoogle() {}
  void continueWithApple() {}

  // OTP helper
  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      otpFocusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    signUpEmailController.dispose();
    createPasswordController.dispose();
    confirmPasswordController.dispose();
    forgotEmailController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in otpFocusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}