import 'package:flutter/material.dart';
import 'package:gratikey/core/widgets/button.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/homecontroller.dart';
import 'appimagecard.dart';
import 'gradienticonbutton.dart';
import 'keysprogressbar.dart';
import 'labeledcard.dart';

/// Home ka bara "Current Key" card: banner + progress + teaching/reflect/action + button.
class KeysJourneyCard extends StatelessWidget {
  final HomeController controller;

  const KeysJourneyCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double side = AppSize.widthPercent(0.045);
    final Color innerCard = Colors.white.withOpacity(0.38);

    return AppImageCard(
      image: controller.keyBannerImage,
      imageHeight: AppSize.widthPercent(0.47),
      radius: AppSize.widthPercent(0.08),
      bodyPadding: EdgeInsets.all(side),
      overlays: [
        /// TOP ROW
        Positioned(
          left: side,
          right: side,
          top: side,
          child: Row(
            children: [
              Icon(
                Icons.key_rounded,
                color: AppColors.secondary1,
                size: AppSize.widthPercent(0.05),
              ),
              SizedBox(width: AppSize.widthPercent(0.012)),
              Expanded(
                child: Text(
                  "My ${controller.totalKeys} Keys Journey",
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.031),
                    color: AppColors.secondary1,
                  ),
                ),
              ),
              ImageLabelPill(
                text: "Key ${controller.currentKey} of ${controller.totalKeys}",
              ),
            ],
          ),
        ),

        /// BOTTOM TITLE
        Positioned(
          left: side,
          right: side,
          bottom: side,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Current Key",
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.036),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: AppSize.widthPercent(0.01)),
              Text(
                "Key ${controller.currentKey}: ${controller.currentKeyTitle}",
                style: TextStyle(
                  fontFamily: "pm",
                  fontSize: AppSize.widthPercent(0.058),
                  height: 1.15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
      child: Column(
        children: [
          /// PROGRESSION HEADER
          Row(
            children: [
              Icon(
                Icons.emoji_events_outlined,
                color: AppColors.textcolor1,
                size: AppSize.widthPercent(0.04),
              ),
              SizedBox(width: AppSize.widthPercent(0.01)),
              Flexible(
                child: Text(
                  "${controller.totalKeys} Keys Progression",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.024),
                    color: AppColors.textcolor1,
                  ),
                ),
              ),
              SizedBox(width: AppSize.height * 0.056),
              Flexible(
                child: Text(
                  controller.keysProgressLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.024),
                    color: AppColors.secondary1,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.widthPercent(0.038)),

          KeysProgressBar(
            total: controller.totalKeys,
            unlocked: controller.unlockedKeys,
          ),

          SizedBox(height: AppSize.widthPercent(0.047)),

          LabeledCard(
            icon: Icons.menu_book_rounded,
            label: "Today's Teaching",
            trailing: controller.teachingDuration,
            text: controller.teachingText,
            color: innerCard,
            shadow: false,
          ),
          SizedBox(height: AppSize.widthPercent(0.03)),
          LabeledCard(
            icon: Icons.remove_red_eye_outlined,
            label: "Reflect",
            text: controller.reflectText,
            color: innerCard,
            shadow: false,
          ),
          SizedBox(height: AppSize.widthPercent(0.03)),
          LabeledCard(
            icon: Icons.volunteer_activism_rounded,
            label: "Take Action",
            text: controller.actionText,
            color: innerCard,
            shadow: false,
          ),

          SizedBox(height: AppSize.widthPercent(0.045)),

          CustomButton(
            title: "Continue Key ${controller.currentKey} Journey",
            onTap: controller.goToContinueKey,
          leftWidget: Icon(Icons.key_rounded,color: Colors.white,),
            leftPadding: EdgeInsets.symmetric(horizontal: AppSize.height*0.02),
          ),
        ],
      ),
    );
  }
}
