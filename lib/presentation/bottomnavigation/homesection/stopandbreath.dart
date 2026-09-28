import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import 'homewidgets/appimagecard.dart';
import 'homewidgets/breathcircle.dart';
import 'homewidgets/phasecard.dart';
import 'homewidgets/practicestep.dart';
import 'homewidgets/softcard.dart';

/// Step 3 of 4 — Just Stop & Breathe (Centering Breathe)
class StopAndBreatheScreen extends StatelessWidget {
  StopAndBreatheScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      // Back dabane par (button ya system) timer band ho jaye
      onPopInvokedWithResult: (didPop, result) => controller.stopBreathing(),
      child: PracticeStepPage(
        step: 3,
        title: "Centering Breathe",
        buttonText: "Continue",
        onButtonTap: controller.finishBreathing,
        child: Column(
          children: [
            SizedBox(height: AppSize.height*0.01,),
            /// IMAGE + TAG
            AppImageCard(
              image: controller.breathBannerImage,
              overlays: [
                Center(child: ImageLabelPill(text: controller.breathTag)),
              ],
            ),

            SizedBox(height: AppSize.widthPercent(0.055)),

            /// BREATHING CARD
            SoftCard(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.04),
                vertical: AppSize.widthPercent(0.07),
              ),
              radius: AppSize.widthPercent(0.08),
              child: Column(
                children: [
                  Obx(
                        () => BreathCircle(
                      label: controller.breathLabel,
                      secondsText: controller.breathSecondsText,
                      scale: controller.breathScale,
                      activeDot: controller.breathPhase.value,
                    ),
                  ),

                  SizedBox(height: AppSize.widthPercent(0.055)),

                  /// CYCLE + REMAINING
                  Obx(
                        () => Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: "pm",
                          fontSize: AppSize.widthPercent(0.03),
                          color: AppColors.textcolor1,
                        ),
                        children: [
                          TextSpan(
                            text:
                            "Cycle ${controller.breathCycle.value} of ${controller.breathCycles} - ",
                          ),
                          TextSpan(
                            text: controller.breathRemainingText,
                            style: TextStyle(color: AppColors.secondary1),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.widthPercent(0.05)),

                  /// PHASES
                  Obx(
                        () => Row(
                      children: List.generate(controller.breathPhases.length, (i) {
                        final Map<String, dynamic> phase = controller.breathPhases[i];

                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.widthPercent(0.012),
                            ),
                            child: PhaseCard(
                              index: i + 1,
                              name: phase["name"] as String,
                              seconds: phase["seconds"] as int,
                              active: controller.isBreathing.value &&
                                  controller.breathPhase.value == i,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.03)),
          ],
        ),
      ),
    );
  }
}
