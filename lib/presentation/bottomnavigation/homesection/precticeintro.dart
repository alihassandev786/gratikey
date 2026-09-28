import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import 'homewidgets/appimagecard.dart';
import 'homewidgets/goldiconcircle.dart';
import 'homewidgets/infotile.dart';

class PracticeIntroScreen extends StatelessWidget {
  PracticeIntroScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.widthPercent(0.05)),

                    /// BANNER + INTRO TEXT
                    AppImageCard(
                      image: controller.practiceBannerImage,
                      imageHeight: AppSize.widthPercent(0.47),
                      radius: AppSize.widthPercent(0.08),
                      bodyPadding: EdgeInsets.all(AppSize.widthPercent(0.06)),
                      overlays: [
                        Positioned(
                          left: AppSize.widthPercent(0.045),
                          right: AppSize.widthPercent(0.045),
                          top: AppSize.widthPercent(0.05),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: AppSize.widthPercent(0.055),
                                ),
                              ),
                              SizedBox(width: AppSize.widthPercent(0.035)),
                              Flexible(
                                child: ImageLabelPill(text: controller.introTag),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: AppSize.widthPercent(0.05),
                          bottom: AppSize.widthPercent(0.04),
                          child: GoldIconCircle(
                            icon: Icons.key_rounded,
                            size: AppSize.widthPercent(0.11),
                            backgroundColor:
                            AppColors.secondary1.withOpacity(0.45),
                          ),
                        ),
                      ],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.introTitle,
                            style: TextStyle(
                              fontFamily: "pm",
                              fontSize: AppSize.widthPercent(0.06),
                              height: 1.2,
                              color: AppColors.textcolor1,
                            ),
                          ),
                          SizedBox(height: AppSize.widthPercent(0.035)),
                          Text(
                            controller.introDescription,
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.031),
                              height: 1.4,
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.widthPercent(0.06)),

                    /// SACRED FLOW
                    Text(
                      controller.introFlowTitle,
                      style: TextStyle(
                        fontFamily: "pm",
                        fontSize: AppSize.widthPercent(0.045),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.widthPercent(0.06)),

                    ...List.generate(controller.flowSteps.length, (index) {
                      final Map<String, dynamic> step =
                      controller.flowSteps[index];

                      return Padding(
                        padding:
                        EdgeInsets.only(bottom: AppSize.height*0.012),
                        child: InfoTile(
                          leading: GoldIconCircle(
                            icon: step["icon"] as IconData,
                            size: AppSize.widthPercent(0.13),
                          ),
                          title: step["title"] as String,
                          subtitle: step["description"] as String,
                          titleTrailing: Text(
                            step["time"] as String,
                            style: TextStyle(
                              fontFamily: "pm",
                              fontSize: AppSize.widthPercent(0.036),
                              color: AppColors.secondary1,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.015)),
            CustomButton(
              title: "Begin Practice",
              onTap: controller.startPracticeFlow,
            ),
            SizedBox(height: AppSize.heightPercent(0.03)),
          ],
        ),
      ),
    );
  }
}
