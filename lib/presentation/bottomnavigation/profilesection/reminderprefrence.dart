import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/button.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/togglepreferencecard.dart';

import '../../../data/controllers/prefrencecontroller.dart';

class DailyReminderPreferenceScreen extends StatefulWidget {
  const DailyReminderPreferenceScreen({super.key});

  @override
  State<DailyReminderPreferenceScreen> createState() => _DailyReminderPreferenceScreenState();
}

class _DailyReminderPreferenceScreenState extends State<DailyReminderPreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    final PreferencesController controller = Get.find<PreferencesController>();

    return AppBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthPercent(0.05),
              vertical: AppSize.heightPercent(0.01),
            ),
            child: Appheader(
              title: "Reminder Preferences",
              subtitle: "Manage your reminder preferences",
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.055),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.heightPercent(0.035)),
                  Obx(() => TogglePreferenceCard(
                    icon: Icons.play_arrow_rounded,
                    title: "Pause All Reminders",
                    subtitle: "Silence alerts without resetting",
                    value: controller.pauseAllReminders.value,
                    onChanged: (_) => controller.togglePauseAll(),
                  )),
                  SizedBox(height: AppSize.widthPercent(0.14)),
                  Obx(() => TogglePreferenceCard(
                    icon: Icons.wb_sunny_outlined,
                    title: "Morning Gratitude Prompt",
                    subtitle: "Scheduled Time ${controller.morningTime}",
                    value: controller.morningGratitude.value,
                    onChanged: (_) => controller.toggleMorning(),
                  )),
                  SizedBox(height: AppSize.widthPercent(0.035)),
                  Obx(() => TogglePreferenceCard(
                    icon: Icons.air_rounded,
                    title: "Midday Breathing",
                    subtitle: "Scheduled Time ${controller.middayTime}",
                    value: controller.middayBreathing.value,
                    onChanged: (_) => controller.toggleMidday(),
                  )),
                  SizedBox(height: AppSize.widthPercent(0.035)),
                  Obx(() => TogglePreferenceCard(
                    icon: Icons.nightlight_round,
                    title: "Evening Reflection",
                    subtitle: "Scheduled Time ${controller.eveningTime}",
                    value: controller.eveningReflection.value,
                    onChanged: (_) => controller.toggleEvening(),
                  )),
                  SizedBox(height: AppSize.widthPercent(0.12)),
                  CustomButton(
                    title: "Save Reminders",
                    onTap: controller.saveReminders,
                  ),
                  SizedBox(height: AppSize.heightPercent(0.04)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
