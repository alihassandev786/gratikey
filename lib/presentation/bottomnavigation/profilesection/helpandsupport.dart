import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/settings_tile.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/soft_input_field.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
              title: "Support Center",
              subtitle: "Acquire any kind of help you want",
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.05),
              child: Column(
                children: [
                  SizedBox(height: AppSize.height * 0.035),

                  Image.asset(
                    'assets/images/logo.png',
                    height: AppSize.height * 0.06,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Text(
                      "GRATIKEY",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary1,
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.height * 0.045),

                  Text(
                    "How can we help?",
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.width * 0.048,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textcolor1,
                    ),
                  ),

                  SizedBox(height: AppSize.height * 0.03),

                  SoftInputField(
                    hint: "Search any kind of help...",
                  prefixIcon: Icons.search_rounded,
                  ),

                  SizedBox(height: AppSize.height * 0.055),

                  SettingsTile(
                    icon: Icons.phone_rounded,
                    title: "Contact Us",
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.quiz_rounded,
                    title: "FAQs",
                    onTap: () {},
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

                  SizedBox(height: AppSize.height * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
