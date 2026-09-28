import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/profile_header.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/section_title.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/settings_tile.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.height * 0.01),

            /// HEADER
            ProfileHeader(
              coverImage: controller.coverImage,
              profileImage: controller.profileImage,
            ),

            SizedBox(height: AppSize.height * 0.008),

            /// USER INFO
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userName,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.width * 0.045,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.height * 0.003),
                Text(
                  controller.userEmail,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.width * 0.031,
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.height * 0.022),

            /// PREMIUM PASS CARD
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width * 0.04,
                vertical: AppSize.height * 0.023,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary3,
                borderRadius: BorderRadius.circular(AppSize.height * 0.03),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gratikey Premium Pass",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.width * 0.036,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.height * 0.004),
                        Text(
                          "Unlock all contemplation",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.width * 0.028,
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    title: "Upgrade",
                    onTap: () {
                      controller.goToUpgrade();
                    },
                    width: AppSize.width * 0.3,
                    height: AppSize.height * 0.058,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.height * 0.025),

            /// PREFERENCES
            const SectionTitle(title: "Preferences"),
            SizedBox(height: AppSize.height * 0.02),
            SettingsTile(
              icon: Icons.notifications_active_rounded,
              title: "Daily Reminder Preferences",
              onTap: controller.goToReminderPreferences,
            ),
            SettingsTile(
              icon: Icons.vpn_key_rounded,
              title: "GratiKey Pass & Membership",
              onTap: controller.goToMembership,
            ),
            SettingsTile(
              icon: Icons.edit_note_rounded,
              title: "Submit Your Story",
              onTap: controller.goToSubmitStory,
            ),
            SettingsTile(
              icon: Icons.menu_book_rounded,
              title: "Faith & Content Preferences",
              onTap: controller.goToFaithPreferences,
            ),

            SizedBox(height: AppSize.height * 0.02),

            /// GENERAL
            const SectionTitle(title: "General"),
            SizedBox(height: AppSize.height * 0.017),
            SettingsTile(
              icon: Icons.person_rounded,
              title: "Account Settings",
              onTap: controller.goToAccountSettings,
            ),
            SettingsTile(
              icon: Icons.notifications_rounded,
              title: "Notifications",
              onTap: controller.goToNotifications,
            ),
            SettingsTile(
              icon: Icons.shield_rounded,
              title: "Privacy & Security",
              onTap: controller.goToPrivacySecurity,
            ),
            SettingsTile(
              icon: Icons.help_outline_rounded,
              title: "Help & Support",
              onTap: controller.goToHelpSupport,
            ),
            SettingsTile(
              icon: Icons.gavel_rounded,
              title: "Community Guidelines",
              onTap: controller.goToCommunityGuidelines,
            ),
            SettingsTile(
              icon: Icons.star_rounded,
              title: "Rate App",
              onTap: controller.goToRateApp,
            ),
            SettingsTile(
              icon: Icons.delete_outline_rounded,
              title: "Delete Account",
              onTap: controller.goToDeleteAccount,
            ),

            SizedBox(height: AppSize.height * 0.02),

            CustomButton(
              title: "Logout",
              onTap: () {
                controller.logout();
              },
              backgroundColor: Color(0xff9D0D0D),
            ),
            SizedBox(height: AppSize.height * 0.04),
          ],
        ),
      ),
    );
  }
}
