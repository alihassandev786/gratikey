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

class DiscussionAndComments extends StatelessWidget {
  const DiscussionAndComments({super.key});

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
              titleSize: AppSize.widthPercent(0.043),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.05),
                      vertical: AppSize.widthPercent(0.07),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: AppSize.widthPercent(0.055),
                              backgroundImage: AssetImage(
                                controller.featuredPost["image"]!,
                              ),
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
                                          text: "Stacy",
                                          style: TextStyle(
                                            fontFamily: "pm",
                                            fontSize: AppSize.widthPercent(
                                              0.038,
                                            ),
                                            color: AppColors.textcolor1,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "  Gratikey Guide",
                                          style: TextStyle(
                                            fontFamily: "pr",
                                            fontSize: AppSize.widthPercent(
                                              0.032,
                                            ),
                                            color: AppColors.secondary1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.discussionMeta,
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
                        SizedBox(height: AppSize.widthPercent(0.045)),
                        Text(
                          controller.discussionQuote,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontSize: AppSize.widthPercent(0.045),
                            height: 1.35,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.04)),
                        Row(
                          children: [
                            Container(
                              width: AppSize.height * 0.03,
                              height: 2,
                              color: AppColors.secondary1,
                            ),
                            SizedBox(width: AppSize.widthPercent(0.02)),
                            Expanded(
                              child: Text(
                                controller.discussionFooter,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.026),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.05)),
                  Text(
                    "Community Reflections",
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.043),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.05)),
                  ...controller.reflections.map((r) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSize.widthPercent(0.03),
                      ),
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
                  SizedBox(height: AppSize.widthPercent(0.04)),
                  SoftCard(
                    radius: AppSize.widthPercent(0.055),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.042),
                      vertical: AppSize.widthPercent(0.07),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Contemplation",
                              style: TextStyle(
                                fontFamily: "pm",
                                fontSize: AppSize.widthPercent(0.038),
                                color: AppColors.textcolor1,
                              ),
                            ),
                            Icon(
                              Icons.edit_note_rounded,
                              color: AppColors.secondary1,
                              size: AppSize.widthPercent(0.06),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.widthPercent(0.04)),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(AppSize.widthPercent(0.035)),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(
                              AppSize.widthPercent(0.04),
                            ),
                          ),
                          child: TextField(
                            controller: controller.reflectionController,
                            maxLines: 5,
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.034),
                              color: AppColors.textcolor1,
                            ),
                            decoration: InputDecoration(
                              hintText: "Share your heartfelt reflection... (Text only)",
                              hintStyle: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.03),
                                color: Colors.grey.shade500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.widthPercent(0.06)),
                        CustomButton(
                          title: "Post Reflection",
                          onTap: controller.postReflection,
                          height: AppSize.heightPercent(0.055),
                          leftPadding: EdgeInsets.symmetric(horizontal: AppSize.height*0.04),
                          leftWidget: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: AppSize.widthPercent(0.05),
                          ),
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
