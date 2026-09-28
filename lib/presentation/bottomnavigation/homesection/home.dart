import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/backbutton.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import '../../others/widgets/gredienttoogle.dart';
import 'homewidgets/fellowshipcard.dart';
import 'homewidgets/goldiconcircle.dart';
import 'homewidgets/goldpill.dart';
import 'homewidgets/infotile.dart';
import 'homewidgets/keysjourneycard.dart';
import 'homewidgets/segmenttoggle.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final double gap = AppSize.widthPercent(0.035);
    final double circle = AppSize.widthPercent(0.105);
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.heightPercent(0.01)),

            /// HEADER (avatar + welcome + notification bell)
            Appheader(
              title: "Welcome ${controller.userName}",
              titleSize: AppSize.height*0.02,
              subtitleSize: AppSize.height*0.015,
              subtitle: controller.greeting,
              profileImage: "assets/images/profile.png",
              rightWidget: Custombackbutton(
                icon: Icons.notifications_rounded,
                size: AppSize.widthPercent(0.13),
                onTap: controller.goToNotifications,
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.02)),

            /// CURRENT KEY CARD
            KeysJourneyCard(controller: controller),

            SizedBox(height: AppSize.widthPercent(0.06)),

            /// TODAY'S PRACTICE
            GoldPill(text: controller.practiceBadge),
            SizedBox(height: AppSize.widthPercent(0.03)),
            Text(
              controller.practiceTitle,
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.045),
                color: AppColors.textcolor1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.008)),
            Text(
              controller.practiceSubtitle,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.03),
                color: AppColors.textcolor2,
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.07)),

            /// 1. GRATITUDE PROMPT
            InfoTile(
              onTap: controller.startPracticeFlow,
              leading: GoldIconCircle(text: "1", size: circle),
              title: controller.practiceSteps[0]["title"]!,
              subtitle: controller.practiceSteps[0]["subtitle"]!,
            ),
            SizedBox(height: gap),

            /// 2. SACRED EXPRESSION (Write / Voice)
            InfoTile(
              onTap: controller.goToReflection,
              leading: GoldIconCircle(text: "2", size: circle),
              title: controller.practiceSteps[1]["title"]!,
              subtitle: controller.practiceSteps[1]["subtitle"]!,
              trailing: Obx(
                    () => SegmentToggle(
                  labels: const ["Write", "Voice"],
                  icons: const [Icons.edit_note_rounded, Icons.mic_none_rounded],
                  selectedIndex: controller.expressionMode.value,
                  onChanged: controller.setExpressionMode,
                  fontSize: AppSize.widthPercent(0.03),
                  height: AppSize.widthPercent(0.085),
                ),
              ),
            ),
            SizedBox(height: gap),

            /// 3. JUST STOP & BREATHE
            InfoTile(
              onTap: controller.goToBreathe,
              leading: GoldIconCircle(text: "3", size: circle),
              title: controller.practiceSteps[2]["title"]!,
              subtitle: controller.practiceSteps[2]["subtitle"]!,
            ),
            SizedBox(height: gap),

            /// 4. DAILY IMPRINT (Verse toggle)
            InfoTile(
              onTap: controller.goToEncouragement,
              leading: GoldIconCircle(text: "4", size: circle),
              title: controller.practiceSteps[3]["title"]!,
              subtitle: controller.practiceSteps[3]["subtitle"]!,
              trailing: Obx(
                    () => Container(
                  padding: EdgeInsets.only(
                    left: AppSize.widthPercent(0.03),
                    right: AppSize.widthPercent(0.015),
                    top: AppSize.widthPercent(0.012),
                    bottom: AppSize.widthPercent(0.012),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Verse",
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.032),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.02)),
                      GradientToggle(
                        value: controller.verseEnabled.value,
                        onChanged: (_) => controller.toggleVerse(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.06)),

            /// BEGIN BUTTON
            CustomButton(
              title: "Begin 3 Min Practice",
              onTap: controller.beginPractice,
            ),

            SizedBox(height: AppSize.widthPercent(0.09)),

            /// JOURNEY OF GRACE
            GoldPill(text: controller.journeyBadge),
            SizedBox(height: AppSize.widthPercent(0.035)),
            Text(
              controller.journeyTitle,
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.045),
                color: AppColors.textcolor1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.04)),

            InfoTile(
              leading: GoldIconCircle(icon: Icons.verified_rounded, size: circle),
              title: controller.completedKeyTitle,
              subtitle: controller.completedKeySubtitle,
            ),
            SizedBox(height: gap),

            FellowshipCard(controller: controller),

            SizedBox(height: AppSize.widthPercent(0.05)),
          ],
        ),
      ),
    );
  }
}
