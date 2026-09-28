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

/// "Key Detail" screen — teaching, guided audio, reflection, action step
/// aur progress checklist ke sath.
class KeyDetailScreen extends StatelessWidget {
  KeyDetailScreen({super.key});

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

            SizedBox(height: AppSize.heightPercent(0.012)),

            /// HEADER CARD (icon + title + quote)
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
                      background: AppColors.secondary3,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.016)),
                  Text(
                    controller.detailKeyTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.042),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),
                  Text(
                    controller.detailKeyQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontStyle: FontStyle.italic,
                      fontSize: AppSize.widthPercent(0.032),
                      color: AppColors.textcolor2,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// OVERVIEW
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle(controller.overviewTitle),
                  SizedBox(height: AppSize.heightPercent(0.012)),
                  Text(
                    controller.overviewText,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.033),
                      color: AppColors.textcolor2,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// SHORT TEACHING
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _sectionTitle("Short Teaching"),
                      Icon(
                        Icons.menu_book_rounded,
                        color: AppColors.secondary1,
                        size: AppSize.widthPercent(0.06),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.heightPercent(0.015)),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSize.widthPercent(0.04)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.045),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.teachingParagraph1,
                          style: TextStyle(
                            fontFamily: "pm",
                            fontWeight: FontWeight.w700,
                            fontSize: AppSize.widthPercent(0.038),
                            color: AppColors.textcolor1,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.014)),
                        Text(
                          controller.teachingParagraph2,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.034),
                            color: AppColors.textcolor2,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),

                  /// GUIDED AUDIO ROW
                  GestureDetector(
                    onTap: controller.playGuidedAudio,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSize.widthPercent(0.055),
                        horizontal: AppSize.widthPercent(0.04),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(
                          AppSize.widthPercent(0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: AppSize.widthPercent(0.105),
                            width: AppSize.widthPercent(0.105),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary1,
                                  AppColors.primary2,
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: AppSize.widthPercent(0.03)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.audioTitle,
                                  style: TextStyle(
                                    fontFamily: "pm",
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSize.widthPercent(0.037),
                                    color: AppColors.textcolor1,
                                  ),
                                ),
                                SizedBox(height: AppSize.height*0.01,),
                                Text(
                                  controller.audioSubtitle,
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.031),
                                    color: AppColors.textcolor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.graphic_eq_rounded,
                            color: AppColors.secondary1,
                            size: AppSize.widthPercent(0.06),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// REFLECTION
            SectionCard(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: AppSize.widthPercent(0.03),vertical: AppSize.widthPercent(0.055)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Reflection"),
                    SizedBox(height: AppSize.heightPercent(0.015)),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(AppSize.widthPercent(0.04)),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(
                          AppSize.widthPercent(0.045),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.inquiryPromptTitle,
                            style: TextStyle(
                              fontFamily: "pm",
                              fontWeight: FontWeight.w700,
                              fontSize: AppSize.widthPercent(0.037),
                              color: AppColors.textcolor1,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.01)),
                          Text(
                            controller.inquiryPromptText,
                            style: TextStyle(
                              fontFamily: "pr",
                              fontStyle: FontStyle.italic,
                              fontSize: AppSize.widthPercent(0.034),
                              color: AppColors.textcolor2,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.018)),
                    CustomButton(
                      title: controller.journalButtonText,
                      onTap: controller.openJournalSanctuary,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// ACTION STEP
            /// ACTION STEP
            SectionCard(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthPercent(0.03),
                  vertical: AppSize.widthPercent(0.055),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Action Step"),
                    SizedBox(height: AppSize.heightPercent(0.015)),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(AppSize.widthPercent(0.04)),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(
                          AppSize.widthPercent(0.045),
                        ),
                      ),
                      child: Text(
                        controller.actionStepText,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.034),
                          color: AppColors.textcolor2,
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.02)),

                    Obx(
                          () => GestureDetector(
                        onTap: controller.toggleActionStep,
                        child: Row(
                          children: [
                            Container(
                              width: AppSize.widthPercent(0.055),
                              height: AppSize.widthPercent(0.055),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: controller.actionStepMarked.value
                                    ? LinearGradient(
                                  colors: [
                                    AppColors.primary1,
                                    AppColors.primary2,
                                  ],
                                )
                                    : null,
                                border: Border.all(
                                  color: controller.actionStepMarked.value
                                      ? AppColors.primary2.withOpacity(0.6)
                                      : Colors.grey.shade400,
                                  width: 1.5,
                                ),
                              ),
                              child: controller.actionStepMarked.value
                                  ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: AppSize.widthPercent(0.035),
                              )
                                  : null,
                            ),
                            SizedBox(width: AppSize.widthPercent(0.02)),
                            Expanded(
                              child: Text(
                                "Mark Action Step Practiced",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.032),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// PROGRESS
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Progress"),
                  SizedBox(height: AppSize.heightPercent(0.016)),
                  Row(
                    children: controller.detailProgressSteps.map((step) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSize.widthPercent(0.01),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppSize.heightPercent(0.016),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(
                              AppSize.widthPercent(0.04),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: AppSize.widthPercent(0.08),
                                width: AppSize.widthPercent(0.08),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff2E9E5B),
                                ),
                                child: const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.01)),
                              Text(
                                step.label,
                                style: TextStyle(
                                  fontFamily: "pm",
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppSize.widthPercent(0.033),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                "Completed",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.028),
                                  color: const Color(0xff2E9E5B),
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
                    title: "Complete Key",
                    onTap: controller.completeKey,
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

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "pm",
        fontWeight: FontWeight.w700,
        fontSize: AppSize.widthPercent(0.042),
        color: AppColors.textcolor1,
      ),
    );
  }
}
