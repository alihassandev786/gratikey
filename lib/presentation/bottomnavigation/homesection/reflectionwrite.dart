import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/homecontroller.dart';
import 'homewidgets/goldpill.dart';
import 'homewidgets/labeledcard.dart';
import 'homewidgets/practicestep.dart';
import 'homewidgets/segmenttoggle.dart';
import 'homewidgets/softcard.dart';
import 'homewidgets/voicerecordercard.dart';
/// Step 2 of 4 — Write Reflection / Voice Reflection (ek hi screen, toggle se mode badalta hai)
class ReflectionWriteScreen extends StatelessWidget {
  ReflectionWriteScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isWrite = controller.expressionMode.value == 0;

      return PracticeStepPage(
        step: 2,
        title: isWrite ? "Write Reflection" : "Voice Reflection",
        buttonText: "Save & Continue to Breathe",
        onButtonTap: controller.saveReflectionAndContinue,
        child: Column(
          children: [
            SizedBox(height: AppSize.height*0.01,),
            /// PROMPT
            LabeledCard(
              icon: Icons.key_rounded,
              label: isWrite
                  ? controller.writePromptLabel
                  : controller.voicePromptLabel,
              text: "\u201C${controller.promptText}\u201D",
            ),

            SizedBox(height: AppSize.widthPercent(0.055)),

            /// WRITE / VOICE TOGGLE
            SegmentToggle(
              expand: true,
              labels: const ["Write Reflection", "Record Voice Reflection"],
              icons: const [Icons.edit_note_rounded, Icons.mic_none_rounded],
              selectedIndex: controller.expressionMode.value,
              onChanged: controller.setExpressionMode,
              fontSize: AppSize.widthPercent(0.036),
              height: AppSize.widthPercent(0.135),
              trackColor: Colors.black.withOpacity(0.07),
            ),

            SizedBox(height: AppSize.widthPercent(0.055)),

            /// WRITE CARD / VOICE CARD
            if (isWrite)
              _journalCard()
            else
              VoiceRecorderCard(controller: controller),

            SizedBox(height: AppSize.widthPercent(0.055)),

            _privacyNote(),

            SizedBox(height: AppSize.widthPercent(0.03)),
          ],
        ),
      );
    });
  }

  Widget _journalCard() {
    return SoftCard(
      padding: EdgeInsets.all(AppSize.widthPercent(0.06)),
      radius: AppSize.widthPercent(0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Private Journal Sanctuary",
            style: TextStyle(
              fontFamily: "pm",
              fontSize: AppSize.widthPercent(0.036),
              color: AppColors.secondary1,
            ),
          ),
          SizedBox(height: AppSize.widthPercent(0.03)),

          TextField(
            controller: controller.reflectionController,
            minLines: 7,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.042),
              height: 1.55,
              color: AppColors.textcolor1,
            ),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: "Write your reflection here...",
              hintStyle: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.042),
                color: AppColors.textcolor2.withOpacity(0.4),
              ),
            ),
          ),

          SizedBox(height: AppSize.widthPercent(0.04)),

          /// MOOD CHIPS
          Obx(
                () => Wrap(
              spacing: AppSize.widthPercent(0.03),
              runSpacing: AppSize.widthPercent(0.02),
              children: controller.moodOptions.map((mood) {
                final String label = mood["label"] as String;
                final bool selected = controller.selectedMoods.contains(label);

                return GoldPill(
                  text: label,
                  icon: mood["icon"] as IconData,
                  fontSize: AppSize.widthPercent(0.036),
                  backgroundColor:
                  AppColors.secondary1.withOpacity(selected ? 0.45 : 0.22),
                  onTap: () => controller.toggleMood(label),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _privacyNote() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.lock_rounded,
          color: AppColors.secondary1,
          size: AppSize.widthPercent(0.05),
        ),
        SizedBox(width: AppSize.widthPercent(0.02)),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.032),
                height: 1.35,
                color: AppColors.textcolor2,
              ),
              children: const [
                TextSpan(
                  text: "Private Journal Sanctuary",
                  style: TextStyle(fontFamily: "pb", color: Colors.black),
                ),
                TextSpan(
                  text:
                  " \u2013 Only visible to you. Never shared, never used for external feeds.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
