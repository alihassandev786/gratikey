import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/backbutton.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import 'homewidgets/confettioverlay.dart';

class PracticeCompleteScreen extends StatelessWidget {
  PracticeCompleteScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.064)),
            child: Column(
              children: [
                SizedBox(height: AppSize.heightPercent(0.02)),

                /// BACK
                Align(
                  alignment: Alignment.centerLeft,
                  child: Custombackbutton(size: AppSize.widthPercent(0.13)),
                ),

                const Spacer(flex: 5),

                /// TITLE
                Text(
                  controller.completeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.055),
                    color: AppColors.textcolor1,
                  ),
                ),

                SizedBox(height: AppSize.widthPercent(0.04)),

                /// SUBTITLE
                Text(
                  controller.completeSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.04),
                    height: 1.4,
                    color: AppColors.textcolor2,
                  ),
                ),

                SizedBox(height: AppSize.widthPercent(0.12)),

                CustomButton(
                  title: "Return to Home",
                  onTap: controller.returnToHome,
                ),

                const Spacer(flex: 6),
              ],
            ),
          ),

          /// CONFETTI
          const ConfettiOverlay(),
        ],
      ),
    );
  }
}
