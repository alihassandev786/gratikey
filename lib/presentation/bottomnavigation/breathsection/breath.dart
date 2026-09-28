import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/breathcontroller.dart';
import '../homesection/homewidgets/goldpill.dart';
import 'breathwidgets/breathorbpreview.dart';
import 'breathwidgets/guidedaudiotile.dart';
import 'breathwidgets/sectionheading.dart';
import 'breathwidgets/sessionoptiontile.dart';

/// Bottom bar ka 4th tab — "Just Stop And Breathe".
class Breath extends StatelessWidget {
  Breath({super.key});

  final BreathController controller = BreathController.to;

  @override
  Widget build(BuildContext context) {
    final double gap = AppSize.widthPercent(0.035);

    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.heightPercent(0.01)),

            /// HEADER
            Appheader(
              title: controller.headerTitle,
              subtitle: controller.headerSubtitle,
            ),

            SizedBox(height: AppSize.heightPercent(0.025)),

            /// BREATHING CIRCLE (Inhale / Exhale khud chalta rehta hai)
            Center(child: BreathOrbPreview()),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// SELECTED SESSION PILL
            Center(
              child: Obx(
                () => GoldPill(
                  icon: Icons.access_time_rounded,
                  text: controller.currentSession.pillLabel,
                  fontSize: AppSize.widthPercent(0.032),
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.045)),

            /// BREATHING SESSIONS
            SectionHeading(title: controller.sessionsTitle),
            SizedBox(height: AppSize.widthPercent(0.045)),

            ...List.generate(controller.breathSessions.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: gap),
                child: Obx(
                  () => SessionOptionTile(
                    session: controller.breathSessions[index],
                    selected: controller.selectedSession.value == index,
                    onTap: () => controller.selectSession(index),
                  ),
                ),
              );
            }),

            SizedBox(height: AppSize.widthPercent(0.03)),

            /// START BUTTON
            CustomButton(
              title: controller.startButtonText,
              onTap: controller.startSession,
            ),

            SizedBox(height: AppSize.heightPercent(0.04)),

            /// GUIDED AUDIO
            SectionHeading(
              title: controller.guidedAudioTitle,
              icon: Icons.graphic_eq_rounded,
              actionText: controller.viewAudioText,
              onActionTap: controller.viewAudioSessions,
            ),
            SizedBox(height: AppSize.widthPercent(0.045)),

            ...controller.guidedAudios.map(
              (track) => Padding(
                padding: EdgeInsets.only(bottom: gap),
                child: GuidedAudioTile(controller: controller, track: track),
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.03)),
          ],
        ),
      ),
    );
  }
}
