import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/appcolor.dart';
import '../../core/widgets/background.dart';
import '../../core/widgets/button.dart';
import '../../core/widgets/mediaquery.dart';
import '../../data/controllers/appsetupcontroller.dart';

class ContentPreferencesScreen extends StatelessWidget {
   ContentPreferencesScreen({super.key});
   final AppSetupController controller = Get.find<AppSetupController>();
  @override
  Widget build(BuildContext context) {

    return AppBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
        child: Column(
          children: [
            SizedBox(height: AppSize.heightPercent(0.033)),

            Image.asset(
              'assets/images/logo.png',
              height: AppSize.heightPercent(0.05),
              fit: BoxFit.contain,
            ),

            SizedBox(height: AppSize.heightPercent(0.05)),

            Text(
              "Content\nPreferences",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.06),
                fontFamily: "pr",
                height: 1.1,
                color: AppColors.textcolor1,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.023)),

            Text(
              "Choose how you'd like your daily reflections,\ntakeaways and prompts.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.widthPercent(0.037),
                fontFamily: "pr",
                color: AppColors.textcolor2,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.055)),

            /// OPTION CARDS (selectable, radio-style)
            Expanded(
              child: ListView.separated(
                
                itemCount: controller.contentOptions.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: AppSize.heightPercent(0.012)),
                itemBuilder: (context, index) {
                  final item = controller.contentOptions[index];
                  return Obx(
                        () => _optionCard(
                      icon: item["icon"] as IconData,
                      title: item["title"] as String,
                      subtitle: item["subtitle"] as String,
                      selected:
                      controller.selectedContentPreference.value == index,
                      onTap: () => controller.selectContentPreference(index),
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              title: "Save & Continue",
              onTap: controller.saveContentPreference,
            ),

            SizedBox(height: AppSize.heightPercent(0.1)),
          ],
        ),
      ),
    );
  }

  Widget _optionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.04),vertical: AppSize.widthPercent(0.05)),
        decoration: BoxDecoration(
          color: AppColors.secondary3.withOpacity(0.55),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: AppSize.widthPercent(0.05),
              backgroundColor: AppColors.secondary1.withOpacity(0.35),
              child: Icon(
                icon,
                color: AppColors.secondary1,
                size: AppSize.widthPercent(0.05),
              ),
            ),
            SizedBox(width: AppSize.widthPercent(0.035)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.0375),
                      fontFamily: "pm",
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.005)),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: AppSize.widthPercent(0.0285),

                      color: AppColors.textcolor2,
                      fontFamily: "pr",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSize.widthPercent(0.02)),

            /// SELECTION INDICATOR
            Container(
              width: AppSize.widthPercent(0.06),
              height: AppSize.widthPercent(0.06),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: selected
                    ? const LinearGradient(
                  colors: [AppColors.primary1, AppColors.primary2],
                )
                    : null,
                border: selected
                    ? null
                    : Border.all(color: AppColors.primary2, width: 1.4),
              ),
              child: selected
                  ? Icon(
                Icons.check,
                color: Colors.white,
                size: AppSize.widthPercent(0.04),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}