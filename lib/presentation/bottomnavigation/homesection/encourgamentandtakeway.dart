import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import 'homewidgets/appimagecard.dart';
import 'homewidgets/goldiconcircle.dart';
import 'homewidgets/labeledcard.dart';
import 'homewidgets/practicestep.dart';
import 'homewidgets/quotetext.dart';

/// Step 4 of 4 — Encouragement & Truth
class EncouragementTakeawayScreen extends StatelessWidget {
  EncouragementTakeawayScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return PracticeStepPage(
      step: 4,
      title: "Encouragement & Truth",
      buttonText: "Complete Today's Practice",
      onButtonTap: controller.completePractice,
      child: Column(
        children: [
          /// IMAGE + VERSE
          AppImageCard(
            image: controller.practiceBannerImage,
            imageHeight: AppSize.widthPercent(0.47),
            radius: AppSize.widthPercent(0.08),
            bodyPadding: EdgeInsets.all(AppSize.widthPercent(0.07)),
            overlays: [
              Positioned(
                left: AppSize.widthPercent(0.075),
                top: AppSize.widthPercent(0.07),
                child: ImageLabelPill(text: controller.encouragementTag),
              ),
              Positioned(
                left: AppSize.widthPercent(0.075),
                bottom: AppSize.widthPercent(0.04),
                child: GoldIconCircle(
                  icon: Icons.key_rounded,
                  size: AppSize.widthPercent(0.11),
                  backgroundColor: AppColors.secondary1.withOpacity(0.45),
                ),
              ),
            ],
            child: Column(
              children: [
                QuoteText(text: controller.verseText),
                SizedBox(height: AppSize.widthPercent(0.04)),
                Text(
                  "\u2022  ${controller.verseReference}",
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.032),
                    color: AppColors.secondary1,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSize.widthPercent(0.045)),

          /// GROUNDED INSIGHT
          LabeledCard(
            icon: Icons.key_rounded,
            label: controller.insightLabel,
            text: controller.insightText,
          ),

          SizedBox(height: AppSize.widthPercent(0.03)),
        ],
      ),
    );
  }
}
