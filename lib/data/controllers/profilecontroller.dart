import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/presentation/auth/login.dart';
import 'package:gratikey/presentation/auth/policy.dart';
import 'package:gratikey/presentation/auth/terms.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/accountsetting.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/changepassword.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/communityguidelines.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/editprofile.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/faithprefrence.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/helpandsupport.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/privacyandsecurity.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/dialoge.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/rateapp.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/notifications.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/reminderprefrence.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/subcryption.dart';
import 'package:gratikey/presentation/others/reminder.dart';

/// Single controller for all Profile section screens.
class ProfileController extends GetxController {
  // ==================== PROFILE DATA ====================
  final String userName = "James Bravo";
  final String userEmail = "Jamesbravo@gmail.com";
  final ImageProvider profileImage =
  const AssetImage('assets/images/profile.png');
  final ImageProvider coverImage =
  const AssetImage('assets/images/profilebanner.png');

  // ==================== EDIT PROFILE ====================
  final usernameController = TextEditingController(text: "James Bravo");
  final emailController = TextEditingController(text: "Jamesbravo@gmail.com");

  // ==================== CHANGE PASSWORD ====================
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isCurrentPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // ==================== RATE APP ====================
  var selectedRating = 0.obs;
  final feedbackController = TextEditingController();

  // ==================== NOTIFICATIONS (sample data) ====================
  final List<Map<String, String>> notifications = [
    {
      "title": "Peace of Mind",
      "body":
      "No spam, streak guilt, or marketing pings. Purely a quiet, reverent nudge for your daily 3-minute gratitude practice.",
      "time": "2m ago",
    },
    {
      "title": "Daily Reflection",
      "body":
      "No spam, streak guilt, or marketing pings. Purely a quite.",
      "time": "5m ago",
    },
    {
      "title": "Daily Reflection",
      "body":
      "No spam, streak guilt, or marketing pings. Purely a quite.",
      "time": "5m ago",
    },
    {
      "title": "Daily Reflection",
      "body":
      "No spam, streak guilt, or marketing pings. Purely a quite.",
      "time": "5m ago",
    },
    {
      "title": "Daily Reflection",
      "body":
      "No spam, streak guilt, or marketing pings. Purely a quite.",
      "time": "5m ago",
    },
  ];

  // ==================== TOGGLES ====================
  void toggleCurrentPasswordVisibility() =>
      isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  void toggleNewPasswordVisibility() =>
      isNewPasswordVisible.value = !isNewPasswordVisible.value;
  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

  void setRating(int rating) => selectedRating.value = rating;

  // ==================== ACTIONS ====================
  void saveProfileChanges() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API - update profile
    AppNavigator.clear(BottomNavigationScreen());
  }

  void updatePassword() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API - change password
    AppNavigator.clear(BottomNavigationScreen());
  }
  void submitRating() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO: API - update profile
    AppNavigator.clear(BottomNavigationScreen());
  }

  void logout() {
    // TODO: clear session / tokens
    ConfirmDialog.show(title: "Logout", message: "Are you sure you want to logout?", onConfirm: (){
      AppNavigator.clear(LoginScreen());
    });
  }

  // ==================== NAVIGATION ====================
  void goToEditProfile() => AppNavigator.push(const EditProfileScreen());
  void goToChangePassword() => AppNavigator.push(const ChangePasswordScreen());
  void goToAccountSettings() =>
      AppNavigator.push(const AccountSettingsScreen());
  void goToNotifications() => AppNavigator.push(const NotificationsScreen());
  void goToPrivacySecurity() =>
      AppNavigator.push(const PrivacySecurityScreen());
  void goToHelpSupport() => AppNavigator.push(const HelpSupportScreen());
  void goToRateApp() => AppNavigator.push(const RateAppScreen());
  void goToTerms() {
    AppNavigator.push(TermsAndConditions());
  } // TODO
  void goToPrivacyPolicy() {
    AppNavigator.push(PrivacyPolicy());
  } // TODO
  void goToReminderPreferences() {
    AppNavigator.push(DailyReminderPreferenceScreen());
  }
  void goToMembership() {
    AppNavigator.push(SubscriptionScreen());
  } // TODO
  void goToSubmitStory() {
  } // TODO
  void goToFaithPreferences() {
    AppNavigator.push(FaithPreferenceScreen());
  } // TODO
  void goToCommunityGuidelines() {
    AppNavigator.push(CommunityGuidelines());
  } // TODO
  void goToDeleteAccount() {
    ConfirmDialog.show(title: "Delete Account", message: "Are you sure you want to delete your account?", onConfirm: (){
      AppNavigator.clear(LoginScreen());
    });
  } // TODO
  void goToUpgrade() {} // TODO

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    feedbackController.dispose();
    super.onClose();
  }
}
