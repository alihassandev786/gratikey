// File: lib/presentation/auth/terms.dart
// (ya profile section mein rakhna ho to path change kar lena)

import 'package:flutter/material.dart';

import 'content.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentScreen(
      title: "Terms & Conditions",
      subtitle: "Understand our terms & conditions",
      paragraphs: const [
        "Welcome to our platform. By accessing or using this application, you agree to comply with these Terms & Conditions. Please read them carefully before using our services.",
        "By creating an account or using any part of the platform, you acknowledge that you have read, understood, and agreed to these terms.",
        "Users are responsible for providing accurate information, maintaining the confidentiality of their account credentials, and using the platform in a lawful manner. You agree not to misuse the platform, interfere with its functionality, or engage in activities that may harm other users or the service. All content, including text, graphics, logos, icons, and software, is the property of the platform or its licensors and is protected by applicable intellectual property laws.",
        "We strive to provide reliable services; however, we do not guarantee uninterrupted or error-free operation. We shall not be liable for any indirect, incidental, or consequential damages arising from the use of the platform.",
        "We reserve the right to update or modify these Terms & Conditions at any time. Continued use of the platform after changes become effective constitutes acceptance of the revised terms.",
      ],
    );
  }
}