import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/homecontroller.dart';
import 'gradienticonbutton.dart';

/// Voice reflection card: timer + waveform + record/stop button + Redo.
class VoiceRecorderCard extends StatelessWidget {
  final HomeController controller;

  const VoiceRecorderCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double barWidth = AppSize.widthPercent(0.016);
    final double maxBarHeight = AppSize.widthPercent(0.17);
    final double button = AppSize.widthPercent(0.21);

    return Obx(() {
      final bool recording = controller.isRecording.value;

      return SoftCard(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.widthPercent(0.04),
          vertical: AppSize.widthPercent(0.07),
        ),
        child: Column(
          children: [
            /// TIMER
            Text(
              controller.recordTimeText,
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.065),
                color: AppColors.secondary1,
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.05)),

            /// WAVEFORM
            SizedBox(
              height: maxBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(controller.waveform.length, (i) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: barWidth,
                    height: maxBarHeight * controller.waveform[i],
                    margin: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.0155),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: i % 4 == 0
                          ? const Color(0xff757575)
                          : AppColors.secondary1,
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.05)),

            /// RECORD / STOP BUTTON
            GestureDetector(
              onTap: controller.toggleRecording,
              child: Container(
                padding: EdgeInsets.all(AppSize.widthPercent(0.022)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.35),
                ),
                child: Container(
                  width: button,
                  height: button,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffDC3030),
                  ),
                  child: Center(
                    child: recording
                        ? Container(
                      width: button * 0.24,
                      height: button * 0.24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    )
                        : Icon(
                      Icons.mic_rounded,
                      color: Colors.white,
                      size: button * 0.42,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.03)),

            Text(
              recording ? "Tap to Finish Speaking" : "Tap to Start Recording",
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.037),
                color: AppColors.textcolor1,
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.05)),

            /// REDO
            GradientIconButton(
              title: "Redo Voice",
              icon: Icons.replay_rounded,
              width: AppSize.widthPercent(0.36),
              height: AppSize.widthPercent(0.11),
              fontSize: AppSize.widthPercent(0.036),
              onTap: controller.redoVoice,
            ),
          ],
        ),
      );
    });
  }
}
