import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';

import '../../core/widgets/background.dart';
import '../../core/widgets/button.dart';
import '../../core/widgets/mediaquery.dart';
import '../../data/controllers/appsetupcontroller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final AppSetupController controller = Get.find<AppSetupController>();


  @override
  Widget build(BuildContext context) {
    // Flow ka pehla screen — controller yahin permanent register hota hai

    return AppBackground(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.rotate(
                angle: 200,
                child: Image(
                  image: AssetImage("assets/images/cloud.png"),
                  height: AppSize.height * 0.03,
                ),
              ),
              Image(
                image: AssetImage("assets/images/cloud.png"),
                height: AppSize.height * 0.1,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: AppSize.heightPercent(0.1),
                  fit: BoxFit.contain,
                ),

                SizedBox(height: AppSize.heightPercent(0.065)),

                /// TITLE
                Text(
                  "Welcome To\nGratiKey!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.06),
                    fontFamily: "pr",
                    height: 1.1,
                    color: AppColors.textcolor1,
                  ),
                ),

                SizedBox(height: AppSize.heightPercent(0.025)),

                /// SUBTITLE
                Text(
                  "GratiKey helps you build a daily practice of gratitude, reflection, breathing, and growth in just three minutes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.039),
                    fontFamily: "pr",
                    color: AppColors.textcolor2,
                  ),
                ),
                SizedBox(height: AppSize.height*0.1,),
                /// CREATE ACCOUNT (GRADIENT — default CustomButton style)
                CustomButton(
                  title: "Create an Account",
                  onTap: () {
                    controller.goToSignup();
                  },
                ),

                SizedBox(height: AppSize.heightPercent(0.01)),

                /// LOGIN (LIGHT VARIANT)
                CustomButton(
                  title: "Login",
                  onTap: () {
                    controller.goToLogin();
                  },
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),

                SizedBox(height: AppSize.heightPercent(0.02)),

                /// FOOTER CAPTION
                Text(
                  "A 3-minute daily practice of restoration & resilience",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.027),
                  color: AppColors.textcolor2,
                    fontFamily: "pr",
                  ),
                ),
                SizedBox(height: AppSize.height*0.11,),
              ],
            ),
          ),
      Align(
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage("assets/images/cloud.png"),
                height: AppSize.height * 0.1,
              ),
            ),


          /// LOGO

        ],
      ),
    );
  }
}
