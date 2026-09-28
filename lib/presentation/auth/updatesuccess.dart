import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/backbutton.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

import '../../data/controllers/passwordcontroller.dart';

class UpdateSuccessScreen extends StatefulWidget {
  UpdateSuccessScreen({super.key});

  @override
  State<UpdateSuccessScreen> createState() => _UpdateSuccessScreenState();
}

class _UpdateSuccessScreenState extends State<UpdateSuccessScreen> {
  final Passwordcontroller controller = Get.find<Passwordcontroller>();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 4),
    );
    // Screen open hote hi confetti start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Stack(
        children: [
          /// MAIN CONTENT
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
            child: Column(
              children: [
                SizedBox(height: AppSize.heightPercent(0.02)),

                /// BACK BUTTON
                Align(
                  alignment: Alignment.centerLeft,
                  child: Custombackbutton(
                    onTap: () => controller.goToLoginFromSuccess(),
                  ),
                ),

                const Spacer(flex: 2),

                /// TITLE
                Text(
                  "Password Changed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.065),
                    fontFamily: "pr",
                    fontWeight: FontWeight.w600,
                    color: AppColors.textcolor1,
                    height: 1.15,
                  ),
                ),

                SizedBox(height: AppSize.heightPercent(0.02)),

                /// SUBTITLE
                Text(
                  "Your password has been successfully updated.\nYou can now log in with your new password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.038),
                    fontFamily: "pr",
                    color: AppColors.textcolor2,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: AppSize.heightPercent(0.06)),

                /// LOGIN NOW BUTTON
                CustomButton(
                  title: "Login Now",
                  onTap: controller.goToLoginFromSuccess,
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),

          /// CONFETTI (top center se girta hai)
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              numberOfParticles: 40,
              gravity: 0.15,
              emissionFrequency: 0.05,
              maxBlastForce: 25,
              minBlastForce: 8,
              colors: const [
                Color(0xFF8FC9D8), // primary1
                Color(0xFFF28C7A), // primary2
                Color(0xFFDDA53E), // secondary1
                Colors.pinkAccent,
                Colors.greenAccent,
                Colors.blueAccent,
                Colors.orangeAccent,
                Colors.purpleAccent,
              ],
            ),
          ),
        ],
      ),
    );
  }
}