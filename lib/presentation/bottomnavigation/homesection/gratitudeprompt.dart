import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import 'homewidgets/appimagecard.dart';
import 'homewidgets/goldiconcircle.dart';
import 'homewidgets/goldpill.dart';
import 'homewidgets/infotile.dart';
import 'homewidgets/practicestep.dart';
import 'homewidgets/quotetext.dart';
import 'homewidgets/softcard.dart';

/// Step 1 of 4 — Gratitude Prompt
class GratitudePromptScreen extends StatelessWidget {
  GratitudePromptScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return PracticeStepPage(
      step: 1,
      title: "Gratitude Prompt",
      buttonText: "Continue",
      onButtonTap: controller.goToReflection,
      child: Column(
        children: [
          SizedBox(height: AppSize.height*0.01,),
          /// IMAGE + TAG
          AppImageCard(
            image: controller.practiceBannerImage,
            overlays: [
              Positioned(
                left: AppSize.widthPercent(0.085),
                top: AppSize.widthPercent(0.075),
                child: ImageLabelPill(text: controller.promptTag),
              ),
            ],
          ),

          SizedBox(height: AppSize.widthPercent(0.055)),

          /// PROMPT CARD
          SoftCard(
            padding: EdgeInsets.all(AppSize.widthPercent(0.07)),
            radius: AppSize.widthPercent(0.08),
            child: Column(
              children: [
                QuoteText(
                  text: controller.promptText,
                  header: Padding(
                    padding: EdgeInsets.only(top: AppSize.widthPercent(0.02)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.spa_rounded,
                          color: AppColors.secondary1,
                          size: AppSize.widthPercent(0.05),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.015)),
                        Text(
                          controller.promptLabel,
                          style: TextStyle(
                            fontFamily: "pm",
                            fontSize: AppSize.widthPercent(0.038),
                            color: AppColors.secondary1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: AppSize.widthPercent(0.05)),

                /// GENTLE PACING
                InfoTile(
                  color: Colors.white.withOpacity(0.4),
                  shadow: false,
                  leading: GoldIconCircle(
                    icon: Icons.air_rounded,
                    size: AppSize.widthPercent(0.13),
                  ),
                  title: controller.pacingTitle,
                  subtitle: controller.pacingText,
                ),

                SizedBox(height: AppSize.widthPercent(0.06)),

                GoldPill(
                  icon: Icons.self_improvement_rounded,
                  text: controller.pacingHint,
                  fontSize: AppSize.widthPercent(0.034),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
