// File: lib/presentation/bottomnavigation/profilesection/profilewidgets/contentscreen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

class ContentScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> paragraphs;

  const ContentScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.paragraphs,
  });

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthPercent(0.05),
              vertical: AppSize.heightPercent(0.01),
            ),
            child: Appheader(
              title: title,
              subtitle: subtitle,
              titleSize: AppSize.widthPercent(0.045),
              subtitleSize: AppSize.widthPercent(0.032),
              showBackButton: true,
              onBack: () => Get.back(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.06),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.02)),
                  ...paragraphs.map((para) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSize.widthPercent(0.055),
                      ),
                      child: Text(
                        para,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.036),
                          height: 1.55,
                          color: AppColors.textcolor1.withOpacity(0.9),
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: AppSize.heightPercent(0.04)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}