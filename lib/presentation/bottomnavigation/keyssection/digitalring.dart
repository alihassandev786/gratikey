import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/keyscontroller.dart';
import 'keyswidgets/progressbar.dart';
import 'keyswidgets/sectioncard.dart';

/// "Digital Ring" screen — 12 keys ka rotating ring visualization,
/// initiation pathway progress, aur active key card.
class DigitalRingScreen extends StatelessWidget {
  DigitalRingScreen({super.key});

  final KeysController controller = Get.find<KeysController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.heightPercent(0.01)),
            Appheader(title: "Digital Ring", showBackButton: true),

            SizedBox(height: AppSize.heightPercent(0.015)),

            /// RING CARD
            SectionCard(
              padding: EdgeInsets.symmetric(
                vertical: AppSize.heightPercent(0.035),
                horizontal: AppSize.widthPercent(0.045),
              ),
              child: Column(
                children: [
                  Text(
                    controller.ringTag,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.032),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.035)),

                  _KeyRing(controller: controller),

                  SizedBox(height: AppSize.heightPercent(0.035)),

                  GestureDetector(
                    onTap: controller.rotateRing,
                    child: Container(
                      height: AppSize.widthPercent(0.15),
                      width: AppSize.widthPercent(0.15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [AppColors.primary1, AppColors.primary2],
                        ),
                      ),
                      child: const Icon(
                        Icons.sync_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.012)),
                  Text(
                    "Rotate Ring",
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.036),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.025)),

            /// INITIATION PATHWAY
            SectionCard(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppSize.widthPercent(0.02),
                  vertical: AppSize.widthPercent(0.035),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.initiationTag,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.widthPercent(0.031),
                        color: AppColors.secondary1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.008)),
                    Obx(
                      () => Text(
                        controller.initiationLabel,
                        style: TextStyle(
                          fontFamily: "pm",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.043),
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.014)),
                    Obx(
                      () => KeyProgressBar(
                        value: controller.initiationProgress,
                        trailingLabel:
                            "${(controller.initiationProgress * 100).round()}%",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.025)),

            /// ACTIVE KEY CARD
            SectionCard(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: AppSize.widthPercent(0.02),vertical: AppSize.widthPercent(0.03)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.activeKeyCardTitle,
                      style: TextStyle(
                        fontFamily: "pm",
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.widthPercent(0.042),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.01)),
                    Text(
                      controller.activeKeyCardText,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.035),
                        color: AppColors.textcolor2,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.02)),
                    CustomButton(
                      title: controller.continueActiveKeyLabel,
                      onTap: controller.continueActiveKey,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.05)),
          ],
        ),
      ),
    );
  }
}
class _KeyRing extends StatelessWidget {
  final KeysController controller;

  const _KeyRing({required this.controller});

  @override
  Widget build(BuildContext context) {
    final double size = AppSize.widthPercent(0.62);

    return Obx(
      () => SizedBox(
        height: size,
        width: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// BASE RING (progress arc + guide circle)
            CustomPaint(
              size: Size(size, size),
              painter: _RingPainter(
                progress: controller.initiationProgress,
                trackColor: AppColors.secondary1.withOpacity(0.18),
                progressColor: AppColors.secondary1,
              ),
            ),

            /// KEY ICONS AROUND THE RING (rotatable group)
            AnimatedRotation(
              turns: controller.ringRotation.value / 360,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              child: SizedBox(
                height: size,
                width: size,
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(controller.ringTotalKeys, (index) {
                    final double angle =
                        (2 * pi / controller.ringTotalKeys) * index - pi / 2;
                    final double radius = size / 2 - AppSize.widthPercent(0.05);
                    final double dx = radius * cos(angle);
                    final double dy = radius * sin(angle);
                    final bool unlocked =
                        index < controller.ringUnlockedCount.value;

                    return Transform.translate(
                      offset: Offset(dx, dy),
                      child: Transform.rotate(
                        angle: angle + pi / 2,
                        child: unlocked
                            ? Image.asset(
                                'assets/images/key.png',
                                height: AppSize.widthPercent(0.08),
                                errorBuilder: (_, __, ___) => Icon(
                                  Icons.vpn_key_rounded,
                                  color: AppColors.secondary1,
                                  size: AppSize.widthPercent(0.065),
                                ),
                              )
                            : Container(
                                height: AppSize.widthPercent(0.022),
                                width: AppSize.widthPercent(0.022),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.textcolor2.withOpacity(0.25),
                                ),
                              ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// CENTER CIRCLE — active key + % complete
            Container(
              height: size * 0.46,
              width: size * 0.46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary1,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Key ${controller.ringActiveKeyNumber.value.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: AppSize.widthPercent(0.05),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.004)),
                    Text(
                      "${controller.ringActiveKeyPercent.value} % Complete",
                      style: TextStyle(
                        fontFamily: "pr",
                        color: Colors.white,
                        fontSize: AppSize.widthPercent(0.03),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ring ke peeche wala progress-arc + halka guide circle draw karta hai.
class _RingPainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final Color progressColor;

  _RingPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - 6;

    final Paint trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.045;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width * 0.045;

    canvas.drawCircle(center, radius, trackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );

    final Paint guidePaint = Paint()
      ..color = trackColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(center, radius + size.width * 0.065, guidePaint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
