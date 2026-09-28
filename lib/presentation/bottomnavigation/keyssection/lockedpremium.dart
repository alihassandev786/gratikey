import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/keyscontroller.dart';
import 'keyswidgets/keyiconbadge.dart';
import 'keyswidgets/sectioncard.dart';

/// Locked/upcoming key tap karne par khulne wali "Key Detail" (Premium)
/// screen — "What Premium Unlocks?" list ke sath.
class LockedPremiumScreen extends StatelessWidget {
  LockedPremiumScreen({super.key});

  final KeysController controller = Get.find<KeysController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.heightPercent(0.01)),
            Appheader(title: "Key Detail", showBackButton: true),

            SizedBox(height: AppSize.heightPercent(0.015)),

            /// PREMIUM HEADER CARD
            SectionCard(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSize.height * 0.004),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: KeyIconBadge(
                      size: AppSize.widthPercent(0.14),
                      outlined: true,
                      background: AppColors.secondary3,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),
                  Text(
                    controller.premiumTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.043),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.012)),
                  Text(
                    controller.premiumDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.033),
                      color: AppColors.textcolor2,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.02)),

            Text(
              controller.premiumSectionTitle,
              style: TextStyle(
                fontFamily: "pm",
                fontWeight: FontWeight.bold,
                fontSize: AppSize.widthPercent(0.04),
                color: AppColors.textcolor1,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.025)),

            /// FEATURES LIST
            SectionCard(
              child: Column(
                children: List.generate(controller.premiumFeatures.length, (i) {
                  final feature = controller.premiumFeatures[i];
                  final bool isLast = i == controller.premiumFeatures.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : AppSize.heightPercent(0.022)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppSize.widthPercent(0.05),
                          width: AppSize.widthPercent(0.05),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondary1,
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: AppSize.widthPercent(0.035),
                          ),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.03)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feature.title,
                                style: TextStyle(
                                  fontFamily: "pm",
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppSize.widthPercent(0.036),
                                  color: AppColors.secondary1,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.004)),
                              Text(
                                "\u2014 ${feature.description}",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.03),
                                  color: AppColors.textcolor1,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.05)),

            CustomButton(
              title: "Unlock Full 12 Keys",
              onTap: controller.unlockPremium,
            ),
            SizedBox(height: AppSize.heightPercent(0.01)),
            CustomButton(
              title: "View Membership options",
              backgroundColor: Colors.white.withOpacity(0.7),
              textColor: AppColors.textcolor1,
              onTap: controller.viewMembershipOptions,
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),
          ],
        ),
      ),
    );
  }
}