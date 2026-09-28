import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/communitycontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/reflectioncard.dart';

class CommunityWall extends StatelessWidget {
  const CommunityWall({super.key});

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
              title: "Community Sanctuary",
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.055),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.01)),
                  SoftCard(
                    radius: AppSize.widthPercent(0.06),
                    padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: AppSize.widthPercent(0.055),
                              backgroundImage: AssetImage(
                                  controller.featuredPost["image"]!),
                            ),
                            SizedBox(width: AppSize.widthPercent(0.03)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: controller.featuredPost["name"]!,
                                          style: TextStyle(
                                            fontFamily: "pm",
                                            fontSize:
                                            AppSize.widthPercent(0.038),
                                            color: AppColors.textcolor1,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          "  ${controller.featuredPost["role"]!}",
                                          style: TextStyle(
                                            fontFamily: "pr",
                                            fontSize:
                                            AppSize.widthPercent(0.032),
                                            color: AppColors.secondary1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.featuredPost["time"]!,
                                    style: TextStyle(
                                      fontFamily: "pr",
                                      fontSize: AppSize.widthPercent(0.028),
                                      color: AppColors.textcolor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.widthPercent(0.03)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.widthPercent(0.03),
                            vertical: AppSize.widthPercent(0.012),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary1.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            controller.featuredPost["tag"]!,
                            style: TextStyle(
                              fontFamily: "pm",
                              fontSize: AppSize.widthPercent(0.028),
                              color: AppColors.secondary1,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.03)),
                        Text(
                          controller.featuredPost["quote"]!,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontSize: AppSize.widthPercent(0.046),
                            height: 1.35,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.05)),
                        CustomButton(
                          title: "Join Discussion & Read",
                          onTap: controller.goToDiscussion,
                          height: AppSize.heightPercent(0.055),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.06)),
                  Text(
                    "Community Reflections",
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.042),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.06)),
                  ...controller.reflections.map((r) {
                    return Padding(
                      padding:
                      EdgeInsets.only(bottom: AppSize.widthPercent(0.03)),
                      child: ReflectionCard(
                        name: r["name"]!,
                        time: r["time"]!,
                        text: r["text"]!,
                        image: r["image"]!,
                        onMute: controller.goToMuteConfirmation,
                        onReport: controller.goToReport,
                        onBlock: controller.goToBlockConfirmation,
                      ),
                    );
                  }).toList(),
                  SizedBox(height: AppSize.heightPercent(0.03)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}