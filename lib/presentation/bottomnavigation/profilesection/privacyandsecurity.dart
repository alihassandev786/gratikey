import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
            child: Appheader(
              title: "Privacy & Security",
              subtitle: "Understand our policy for privacy & Security",
              subtitleSize: AppSize.height*0.014,
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width * 0.06,
                vertical: AppSize.height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildParagraph(
                    '"Your privacy and security are our top priorities. We are committed to protecting your personal information through secure practices and advanced protection measures. Your data is collected, stored, and processed responsibly to ensure a safe and reliable experience. We continuously monitor our systems and update our security protocols to prevent unauthorized access and maintain confidentiality."',
                  ),
                  SizedBox(height: AppSize.height * 0.022),
                  _buildParagraph(
                    "Users are responsible for providing accurate information, maintaining the confidentiality of their account credentials, and using the platform in a lawful manner. You agree not to misuse the platform, interfere with its functionality, or engage in activities that may harm other users or the service. All content, including text, graphics, logos, icons, and software, is the property of the platform or its licensors and is protected by applicable intellectual property laws.",
                  ),
                  SizedBox(height: AppSize.height * 0.022),
                  _buildParagraph(
                    "We strive to provide reliable services; however, we do not guarantee uninterrupted or error-free operation. We shall not be liable for any indirect, incidental, or consequential damages arising from the use of the platform.",
                  ),
                  SizedBox(height: AppSize.height * 0.022),
                  _buildParagraph(
                    "We reserve the right to update or modify these Terms & Conditions at any time. Continued use of the platform after changes become effective constitutes acceptance of the revised terms.",
                  ),
                  SizedBox(height: AppSize.height * 0.04),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "pr",
        fontSize: AppSize.width * 0.032,
        color: AppColors.textcolor2,
        height: 1.5,
      ),
    );
  }
}
