import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/infopointrow.dart';
import '../../../data/controllers/communitycontroller.dart';

class MuteUserConfirmation extends StatefulWidget {
  const MuteUserConfirmation({super.key});

  @override
  State<MuteUserConfirmation> createState() => _MuteUserConfirmationState();
}

class _MuteUserConfirmationState extends State<MuteUserConfirmation> {
  @override
  Widget build(BuildContext context) {
    final CommunityController controller = Get.find<CommunityController>();

    return AppBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthPercent(0.05),
              vertical: AppSize.heightPercent(0.01),
            ),
            child: Appheader(
              title: "Mute User Confirmation",
              titleSize: AppSize.widthPercent(0.045),
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
                  SoftCard(
                    radius: AppSize.widthPercent(0.08),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.06),
                      vertical: AppSize.widthPercent(0.07),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: AppSize.widthPercent(0.12),
                          backgroundImage:
                          AssetImage(controller.targetUserImage),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.04)),
                        Text(
                          "Mute Reflections from ${controller.targetUserName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "pm",
                            fontSize: AppSize.widthPercent(0.04),
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.025)),
                        Text(
                          "Curate your daily presence with gentle boundaries, safeguarding your personal peace.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.034),
                            height: 1.4,
                            color: AppColors.textcolor2.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.055)),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(
                              AppSize.widthPercent(0.055),
                            ),
                          ),
                          child: Column(
                            children: [
                              const InfoPointRow(
                                icon: Icons.visibility_off_outlined,
                                text:
                                "Their shared reflections and comments will gracefully disappear from your Community Wall.",
                              ),
                              SizedBox(height: AppSize.widthPercent(0.045)),
                              const InfoPointRow(
                                icon: Icons.lock_outline_rounded,
                                text:
                                "Marcus T. will not be notified or aware that you have muted their voice.",
                              ),
                              SizedBox(height: AppSize.widthPercent(0.045)),
                              const InfoPointRow(
                                icon: Icons.spa_outlined,
                                text:
                                "This supports a quiet, centered reading flow without severing connections or blocking entirely.",
                              ),
                              SizedBox(height: AppSize.widthPercent(0.045)),
                              const InfoPointRow(
                                icon: Icons.tune_rounded,
                                text:
                                "You can unmute their reflections anytime under your Content",
                                highlightWord: "Content",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.08)),
                        CustomButton(
                          title: "Mute Member",
                          onTap: controller.muteMember,
                          height: AppSize.heightPercent(0.058),
                        ),
                      ],
                    ),
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
