import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/presentation/others/widgets/gredienttoogle.dart';

import '../../core/constants/appcolor.dart';
import '../../core/widgets/background.dart';
import '../../core/widgets/button.dart';
import '../../core/widgets/mediaquery.dart';
import '../../data/controllers/appsetupcontroller.dart';

class ReminderPreferencesScreen extends StatelessWidget {
  ReminderPreferencesScreen({super.key});

  // Controller yahan create hoga jab screen open hogi
  final AppSetupController controller = Get.find<AppSetupController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),

        child: Column(
          children: [
            SizedBox(height: AppSize.heightPercent(0.033)),

            Image.asset(
              'assets/images/logo.png',
              height: AppSize.heightPercent(0.05),
              fit: BoxFit.contain,
            ),

            SizedBox(height: AppSize.heightPercent(0.05)),

            Text(
              "Reminder\nPreferences",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: AppSize.widthPercent(0.06),
                fontFamily: "pr",
                height: 1.1,
                color: AppColors.textcolor1,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.023)),

            Text(
              "Set gentle daily nudges to protect your\npeace and consistency.",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: AppSize.widthPercent(0.039),
                fontFamily: "pr",
                color: AppColors.textcolor2,
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.055)),

            Expanded(
              child: ListView.separated(
                

                itemCount: controller.reminderOptions.length,

                separatorBuilder: (_, __) =>
                    SizedBox(height: AppSize.heightPercent(0.012)),

                itemBuilder: (context, index) {
                  final item = controller.reminderOptions[index];

                  return Obx(
                    () => _reminderCard(
                      icon: item["icon"] as IconData,

                      title: item["title"] as String,

                      time: controller.reminderTime[index],

                      enabled: controller.reminderEnabled[index],

                      onToggle: () {
                        controller.toggleReminder(index);
                      },

                      onTimeTap: () {
                        controller.pickReminderTime(context, index);
                      },
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              title: "Continue to Journal",
              onTap: controller.continueToJournal,
            ),
            SizedBox(height: AppSize.height*0.14,)
          ],
        ),
      ),
    );
  }

  Widget _reminderCard({
    required IconData icon,

    required String title,

    required String time,

    required bool enabled,

    required VoidCallback onToggle,

    required VoidCallback onTimeTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.06),
        horizontal: AppSize.widthPercent(0.04),
      ),

      decoration: BoxDecoration(
        color: AppColors.secondary3,

        borderRadius: BorderRadius.circular(AppSize.height * 0.03),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.widthPercent(0.05),

            backgroundColor: AppColors.secondary1.withOpacity(0.35),

            child: Icon(
              icon,

              color: AppColors.secondary1,

              size: AppSize.widthPercent(0.05),
            ),
          ),

          SizedBox(width: AppSize.widthPercent(0.035)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: TextStyle(
                    fontSize: AppSize.widthPercent(0.0375),
                    fontFamily: "pm",
                    color: AppColors.textcolor1,
                  ),
                ),

                SizedBox(height: AppSize.heightPercent(0.005)),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Scheduled Time  ",
                        style: TextStyle(
                          fontSize: AppSize.widthPercent(0.0285),
                          color: AppColors.textcolor2,
                          fontFamily: "pr",
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: GestureDetector(
                          onTap: onTimeTap,
                          child: Text(
                            time,
                            style: TextStyle(
                              fontSize: AppSize.widthPercent(0.0285),
                              color: AppColors.textcolor2,
                              fontFamily: "pr",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          GradientToggle(value: enabled, onChanged: (_) => onToggle()),
        ],
      ),
    );
  }
}
