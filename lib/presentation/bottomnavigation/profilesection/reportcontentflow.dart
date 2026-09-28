import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/communitycontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/selectableoptioncard.dart';

class ReportContentFlow extends StatelessWidget {
  const ReportContentFlow({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.01)),
                  SoftCard(
                    radius: AppSize.widthPercent(0.055),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.04),vertical: AppSize.widthPercent(0.06)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: AppSize.widthPercent(0.055),
                          backgroundImage:
                          AssetImage(controller.targetUserImage),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.03)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stacy T.",
                                style: TextStyle(
                                  fontFamily: "pm",
                                  fontSize: AppSize.widthPercent(0.038),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                "Shared In Dawn Reflections",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.03),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                              SizedBox(height: AppSize.widthPercent(0.02)),
                              Text(
                                "“When in your day do you feel the most unhurried stillness, and how does that quiet moment open your eyes to gratitude?”",
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.029),
                                  height: 1.35,
                                  color: AppColors.textcolor1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.04)),
                  Text(
                    "Reason for Reporting",
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.043),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.05)),
                  Obx(
                        () => Column(
                      children: List.generate(controller.reportReasons.length,
                              (index) {
                            final reason = controller.reportReasons[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: AppSize.widthPercent(0.03)),
                              child: SelectableOptionCard(
                                showIcon: false,
                                title: reason["title"]!,
                                subtitle: reason["subtitle"]!,
                                isSelected:
                                controller.selectedReportReason.value == index,
                                onTap: () => controller.selectReportReason(index),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.07)),
                  SoftCard(
                    radius: AppSize.widthPercent(0.06),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.04),vertical: AppSize.widthPercent(0.065)),
                    child: Column(
                      children:[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Additional Details (Optional)",
                            style: TextStyle(
                              fontFamily: "pm",
                              fontSize: AppSize.widthPercent(0.038),
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.height*0.03,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(AppSize.height*0.03)
                          ),
                          child: TextField(
                          controller: controller.reportDetailsController,
                          maxLines: 4,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.034),
                            color: AppColors.textcolor1,
                          ),
                          decoration: InputDecoration(
                            hintText: "Gently describe what felt with sanctuary..",
                            hintStyle: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.03),
                              color: Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.all(AppSize.widthPercent(0.05)),
                          ),
                                                ),
                        ),]
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.06)),
                  CustomButton(
                    title: "Submit Report for Review",
                    onTap: controller.submitReport,
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
