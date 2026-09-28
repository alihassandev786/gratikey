import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/settings_tile.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return AppBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
            child: Appheader(
              title: "Account Settings",
              subtitle: "Manage your account settings",
              showBackButton: true,
            ),
          ),
          SizedBox(height: AppSize.height * 0.02),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.05),
              child: Column(
                children: [
                  SettingsTile(
                    icon: Icons.person_rounded,
                    title: "Edit Profile",
                    onTap: controller.goToEditProfile,
                  ),
                  SettingsTile(
                    icon: Icons.lock_rounded,
                    title: "Change Password",
                    onTap: controller.goToChangePassword,
                  ),
                  SettingsTile(
                    icon: Icons.gavel_rounded,
                    title: "Terms & Conditions",
                    onTap: controller.goToTerms,
                  ),
                  SettingsTile(
                    icon: Icons.help_outline_rounded,
                    title: "Privacy Policy",
                    onTap: controller.goToPrivacyPolicy,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
