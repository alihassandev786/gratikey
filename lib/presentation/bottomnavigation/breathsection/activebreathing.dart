import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/button.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/breathcontroller.dart';
import 'breathwidgets/breathorblive.dart';
import 'breathwidgets/somatictipcard.dart';

/// Active Breathing — timer + chalta hua circle + Pause/Resume/Complete.
class ActiveBreathingScreen extends StatelessWidget {
  ActiveBreathingScreen({super.key});

  final BreathController controller = BreathController.to;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      // Back dabane par (button ya system) session ka timer band ho jaye
      onPopInvokedWithResult: (didPop, result) => controller.exitSession(),
      child: AppBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
          child: Column(
            children: [
              SizedBox(height: AppSize.heightPercent(0.01)),

              /// HEADER
              Appheader(
                title: controller.activeScreenTitle,
                showBackButton: true,
              ),

              Expanded(
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: [
                      SizedBox(height: AppSize.heightPercent(0.05)),

                      /// SESSION TITLE
                      Obx(
                        () => Text(
                          controller.sessionTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.043),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.012)),

                      /// REMAINING + CYCLE
                      Obx(
                        () => Text(
                          controller.sessionStatusText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.032),
                            color: AppColors.secondary1,
                          ),
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.045)),

                      /// BREATHING CIRCLE
                      Obx(
                        () => BreathOrbLive(
                          targetScale: controller.orbScale,
                          phaseDuration: controller.orbDuration,
                          paused: controller.isSessionPaused.value,
                          phaseId: controller.phaseId,
                          label: controller.phaseLabel,
                          progress: controller.phaseProgress,
                          progressDuration: controller.progressDuration,
                          secondsText: controller.phaseSecondsText,
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.06)),

                      /// SOMATIC GROUNDING TIP
                      Obx(
                        () => SomaticTipCard(
                          title: controller.tipTitle,
                          text: controller.currentTip,
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.06)),

                      /// PAUSE / RESUME / COMPLETE
                      Obx(
                        ()=> CustomButton(title: controller.sessionButtonText,
                          leftWidget: Icon(controller.sessionButtonIcon,color: Colors.white,),
                          leftPadding: EdgeInsets.symmetric(horizontal: AppSize.height*0.045),
                          onTap: controller.onSessionButtonTap,),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.04)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
