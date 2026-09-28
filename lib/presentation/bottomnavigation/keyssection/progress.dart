import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/keyscontroller.dart';
import 'keyswidgets/keyiconbadge.dart';
import 'keyswidgets/progressbar.dart';
import 'keyswidgets/sectioncard.dart';

/// "Progress" screen — banner, weekly cadence, mastery path, now-unlocking
/// aur digital key ring preview.
class ProgressScreen extends StatelessWidget {
  ProgressScreen({super.key});

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
            Appheader(title: "Progress", showBackButton: true),

            SizedBox(height: AppSize.heightPercent(0.012)),

            /// BANNER CARD
            SectionCard(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSize.widthPercent(0.06)),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          controller.progressBannerImage,
                          height: AppSize.heightPercent(0.2),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: AppSize.heightPercent(0.015),
                          left: AppSize.widthPercent(0.035),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.widthPercent(0.03),
                              vertical: AppSize.heightPercent(0.006),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              controller.progressBannerTag,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.03),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: AppSize.heightPercent(0.015),
                          left: AppSize.widthPercent(0.035),
                          child: KeyIconBadge(
                            size: AppSize.widthPercent(0.1),
                            background: Colors.white.withOpacity(0.25),
                            iconColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.055),
                      vertical: AppSize.widthPercent(0.06),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.progressBannerTitle,
                          style: TextStyle(
                            fontFamily: "pm",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.045),
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.01)),
                        Text(
                          controller.progressBannerText,
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
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.018)),

            /// WEEKLY CADENCE
            SectionCard(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppSize.widthPercent(0.03),
                  vertical: AppSize.widthPercent(0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.cadenceTag,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.widthPercent(0.031),
                        color: AppColors.secondary1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.006)),
                    Text(
                      controller.cadenceTitle,
                      style: TextStyle(
                        fontFamily: "pm",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.043),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.02)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.weeklyCadence.map((day) {
                        return Column(
                          children: [
                            Text(
                              day.label,
                              style: TextStyle(
                                fontFamily: "pm",
                                fontWeight: FontWeight.w700,
                                fontSize: AppSize.widthPercent(0.033),
                                color: day.isGoal
                                    ? AppColors.secondary1
                                    : AppColors.textcolor2,
                              ),
                            ),
                            SizedBox(height: AppSize.heightPercent(0.01)),
                            _cadenceDot(day),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// MASTERY PATH
            SectionCard(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: AppSize.widthPercent(0.03),vertical: AppSize.widthPercent(0.05)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.masteryTag,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.widthPercent(0.031),
                        color: AppColors.secondary1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.006)),
                    Text(
                      "${controller.masteredKeys} of ${controller.totalKeysCount} Keys Mastered",
                      style: TextStyle(
                        fontFamily: "pm",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.043),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.01)),
                    Row(
                      children: [
                        Text(
                          "Overall Journey: ",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.034),
                            color: AppColors.textcolor2,
                          ),
                        ),
                        Text(
                          controller.overallJourneyLabel,
                          style: TextStyle(
                            fontFamily: "pm",
                            fontWeight: FontWeight.w700,
                            fontSize: AppSize.widthPercent(0.031),
                            color: const Color(0xff2E9E5B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.heightPercent(0.014)),
                    KeyProgressBar(value: controller.overallJourneyProgress),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// NOW UNLOCKING
            GestureDetector(
              onTap: () => controller.goToKeyDetail(3),
              child: SectionCard(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: AppSize.widthPercent(0.02),vertical: AppSize.widthPercent(0.02)),
                  child: Row(
                    children: [
                      KeyIconBadge(size: AppSize.widthPercent(0.11)),
                      SizedBox(width: AppSize.widthPercent(0.03)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.nowUnlockingTag,
                              style: TextStyle(
                                fontFamily: "pm",
                                fontWeight: FontWeight.w700,
                                fontSize: AppSize.widthPercent(0.031),
                                color: AppColors.secondary1,
                              ),
                            ),
                            SizedBox(height: AppSize.height*0.012,),
                            Text(
                              controller.nowUnlockingTitle,
                              style: TextStyle(
                                fontFamily: "pm",
                                fontWeight: FontWeight.w700,
                                fontSize: AppSize.widthPercent(0.04),
                                color: AppColors.textcolor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: AppSize.widthPercent(0.1),
                        width: AppSize.widthPercent(0.1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [AppColors.primary1, AppColors.primary2],
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// DIGITAL KEY RING PREVIEW
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.ringSectionTitle,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.043),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),
                  Text(
                    controller.ringSectionText,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.032),
                      color: AppColors.textcolor2,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.02)),
                  Row(
                    children: controller.ringMiniKeys.map((mini) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSize.widthPercent(0.012),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppSize.heightPercent(0.018),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                              AppSize.widthPercent(0.045),
                            ),
                          ),
                          child: Column(
                            children: [
                              KeyIconBadge(size: AppSize.widthPercent(0.1)),
                              SizedBox(height: AppSize.heightPercent(0.01)),
                              Text(
                                "Key ${mini.number.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.028),
                                  color: AppColors.secondary1,
                                ),
                              ),
                              Text(
                                mini.label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "pm",
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppSize.widthPercent(0.032),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                mini.day,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.028),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.02)),
                  CustomButton(
                    title: controller.viewFullRingLabel,
                    onTap: controller.goToDigitalRing,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),
          ],
        ),
      ),
    );
  }

  Widget _cadenceDot(CadenceDay day) {
    if (day.done) {
      return Container(
        height: AppSize.widthPercent(0.09),
        width: AppSize.widthPercent(0.09),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff2E9E5B),
        ),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
      );
    } else if (day.isGoal) {
      return Container(
        height: AppSize.widthPercent(0.09),
        width: AppSize.widthPercent(0.09),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary1.withOpacity(0.85),
        ),
        child: const Icon(Icons.star_rounded, color: Colors.white, size: 16),
      );
    } else if (day.isToday) {
      return Container(
        height: AppSize.widthPercent(0.09),
        width: AppSize.widthPercent(0.09),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.7),
          border: Border.all(color: AppColors.secondary1.withOpacity(0.4)),
        ),
        child: Center(
          child: Container(
            height: AppSize.widthPercent(0.02),
            width: AppSize.widthPercent(0.02),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary1,
            ),
          ),
        ),
      );
    }
    return Container(
      height: AppSize.widthPercent(0.09),
      width: AppSize.widthPercent(0.09),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
