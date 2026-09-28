import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/selectableoptioncard.dart';

import '../../../data/controllers/prefrencecontroller.dart';

class FaithPreferenceScreen extends StatelessWidget {
  const FaithPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PreferencesController controller = Get.find<PreferencesController>();

    return AppBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthPercent(0.05),
              vertical: AppSize.heightPercent(0.01),
            ),
            child: Appheader(
              title: "Tailor Your Sanctuary Guidance",
              titleSize: AppSize.widthPercent(0.042),
              subtitle: "Choose how you'd like your daily reflections",
              subtitleSize: AppSize.widthPercent(0.032),
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.055),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.heightPercent(0.02)),
                  Obx(
                        () => Column(
                      children: List.generate(controller.faithOptions.length,
                              (index) {
                            final opt = controller.faithOptions[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: AppSize.heightPercent(0.01)),
                              child: SelectableOptionCard(
                                icon: opt["icon"] as IconData,
                                title: opt["title"] as String,
                                subtitle: opt["subtitle"] as String,
                                isSelected:
                                controller.selectedFaithOption.value == index,
                                onTap: () => controller.selectFaithOption(index),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.08)),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
                    decoration: BoxDecoration(
                      color: AppColors.secondary1,
                      borderRadius:
                      BorderRadius.circular(AppSize.widthPercent(0.055)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: AppSize.widthPercent(0.11),
                          height: AppSize.widthPercent(0.11),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.25),
                          ),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: Colors.white,
                            size: AppSize.widthPercent(0.045),
                          ),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.03)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How This Guide You",
                                style: TextStyle(
                                  fontFamily: "pm",
                                  fontSize: AppSize.widthPercent(0.038),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: AppSize.widthPercent(0.012)),
                              Text(
                                "This preference controls daily verses, inquiry framing, and weekly messages from Stacy in your Home feed and Journal.",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.032),
                                  height: 1.35,
                                  color: Colors.white.withOpacity(0.95),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.15)),
                  CustomButton(
                    title: "Save Content Preferences",
                    onTap: controller.saveFaithPreferences,
                    height: AppSize.heightPercent(0.065),
                  ),
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
