import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/communitycontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/goldiconcircle.dart';

class CommunityGuidelines extends StatelessWidget {
  const CommunityGuidelines({super.key});

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
              title: "Community & Safety Guidelines",
              titleSize: AppSize.widthPercent(0.042),
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
                  SizedBox(height: AppSize.heightPercent(0.01)),

                  /// BANNER IMAGE
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(AppSize.widthPercent(0.06)),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/precticeintro.png",
                          height: AppSize.heightPercent(0.18),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: AppSize.widthPercent(0.04),
                          bottom: AppSize.widthPercent(0.04),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.widthPercent(0.03),
                              vertical: AppSize.widthPercent(0.015),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Tended with intention, care and privacy",
                              style: TextStyle(
                                fontFamily: "pm",
                                fontSize: AppSize.widthPercent(0.028),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.09)),

                  /// GUIDELINE CARDS
                  ...controller.guidelines.map((g) {
                    return Padding(
                      padding:
                      EdgeInsets.only(bottom: AppSize.widthPercent(0.03)),
                      child: SoftCard(
                        radius: AppSize.widthPercent(0.055),
                        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.04),vertical: AppSize.widthPercent(0.06)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GoldIconCircle(
                              icon: g["icon"] as IconData,
                              size: AppSize.widthPercent(0.1),
                            ),
                            SizedBox(width: AppSize.widthPercent(0.035)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    g["title"] as String,
                                    style: TextStyle(
                                      fontFamily: "pm",
                                      fontSize: AppSize.widthPercent(0.038),
                                      color: AppColors.textcolor1,
                                    ),
                                  ),
                                  SizedBox(height: AppSize.widthPercent(0.012)),
                                  Text(
                                    g["subtitle"] as String,
                                    style: TextStyle(
                                      fontFamily: "pr",
                                      fontSize: AppSize.widthPercent(0.032),
                                      height: 1.35,
                                      color: AppColors.textcolor2
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  SizedBox(height: AppSize.widthPercent(0.02)),

                  /// AGREEMENT CHECKBOX
                  Obx(
                        () => GestureDetector(
                      onTap: controller.toggleGuidelinesAgree,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppSize.widthPercent(0.055),
                            height: AppSize.widthPercent(0.055),
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: controller.agreedToGuidelines.value
                                  ? LinearGradient(
                                colors: [
                                  AppColors.primary1,
                                  AppColors.primary2,
                                ],
                              )
                                  : null,
                              color: controller.agreedToGuidelines.value
                                  ? null
                                  : Colors.transparent,
                              border: Border.all(
                                color: controller.agreedToGuidelines.value
                                    ? AppColors.primary2.withOpacity(0.6)
                                    : Colors.grey.shade400,
                                width: 1.5,
                              ),
                            ),
                            child: controller.agreedToGuidelines.value
                                ? Icon(
                              Icons.check,
                              size: AppSize.widthPercent(0.035),
                              color: Colors.white,
                            )
                                : null,
                          ),
                          SizedBox(width: AppSize.widthPercent(0.025)),
                          Expanded(
                            child: Text(
                              "I agree to honour this sanctuary and uphold mutual grace, confidentiality, and shared upliftment for all the members",
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.03),
                                height: 1.3,
                                color: AppColors.textcolor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.05)),

                  CustomButton(
                    title: "Continue to Community",
                    onTap: controller.continueToCommunity,
                    height: AppSize.heightPercent(0.065),
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
