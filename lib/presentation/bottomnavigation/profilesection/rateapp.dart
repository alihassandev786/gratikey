import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/soft_input_field.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return AppBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
            child: Appheader(
              title: "Rate App",
              subtitle: "Show your response for using this app",
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.06),
              child: Column(
                children: [
                  SizedBox(height: AppSize.height * 0.06),

                  Text(
                    "How was your experience?",
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.width * 0.048,
                      color: AppColors.textcolor1,
                    ),
                  ),

                  SizedBox(height: AppSize.height * 0.04),

                  Obx(
                        () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final int star = index + 1;
                        final bool selected = controller.selectedRating.value >= star;
                        return GestureDetector(
                          onTap: () => controller.setRating(star),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width * 0.015,
                            ),
                            child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [AppColors.primary1, AppColors.primary2],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds),
                              child: Icon(
                                selected ? Icons.star_rounded : Icons.star_outline_rounded,
                                size: AppSize.width * 0.1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: AppSize.height * 0.06),

                  SoftInputField(
                    controller: controller.feedbackController,
                    hint: "Share your feedback...",
                    expands: true,
                    maxLines: null,
                    height: AppSize.height * 0.18,
                    textAlignVertical: TextAlignVertical.top,
                  ),

                  SizedBox(height: AppSize.height * 0.066),

                  CustomButton(
                    title: "Submit",
                    onTap: controller.submitRating,
                  ),

                  SizedBox(height: AppSize.height * 0.04),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
