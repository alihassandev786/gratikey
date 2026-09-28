import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/journalcontroller.dart';
import 'gratitudegeneralsecwidgets/entrylistcard.dart';
import 'gratitudegeneralsecwidgets/memberstatuscard.dart';


class Gratitudegeneral extends StatefulWidget {
  const Gratitudegeneral({super.key});

  @override
  State<Gratitudegeneral> createState() => _GratitudegeneralState();
}

class _GratitudegeneralState extends State<Gratitudegeneral> {
  final JournalController controller = Get.find<JournalController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.heightPercent(0.01)),

            /// HEADER
            Appheader(
              title: "Gratitude Journal",
              subtitle: "Your private sanctuary of reflection.",
            ),

            SizedBox(height: AppSize.widthPercent(0.03)),

            /// FREE / PREMIUM STATUS CARD
            Obx(
                  () => MemberStatusCard(
                isPremium: controller.isPremium.value,
                used: controller.entries.length,
                limit: controller.freeEntryLimit,
                onUnlockTap: controller.goToUnlockUnlimited,
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.06)),

            /// + NEW ENTRY
           CustomButton(
                title: "+ New Entry",
                onTap: controller.goToCreateEntry,
              ),


            SizedBox(height: AppSize.widthPercent(0.05)),

            /// RECENT REFLECTIONS
            Text(
              "Recent Reflections",
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.043),
                color: AppColors.textcolor1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.05)),

            Obx(() {
              if (controller.entries.isEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.widthPercent(0.05)),
                  child: Text(
                    "No reflections yet. Start your first entry above.",
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.036),
                      color: AppColors.textcolor2,
                    ),
                  ),
                );
              }
              return Column(
                children: controller.entries.map((entry) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: AppSize.widthPercent(0.04)),
                    child: EntryListCard(
                      dateLabel: controller.formattedDateWithDay(entry["date"] as DateTime),
                      preview: entry["text"] as String,
                      tag: entry["tag"] as String,
                      onView: () => controller.goToEntryDetail(entry),
                    ),
                  );
                }).toList(),
              );
            }),

            SizedBox(height: AppSize.widthPercent(0.05)),

            /// A SPACE FREE FROM NOISE
            Center(
              child: Column(
                children: [
                  Container(
                    height: AppSize.widthPercent(0.11),
                    width: AppSize.widthPercent(0.11),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.spa_outlined,
                        color: AppColors.textcolor1, size: AppSize.widthPercent(0.06)),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.03)),
                  Text(
                    "A Space Free From Noise",
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.045),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.02)),
                  Text(
                    "No public vanity metrics, algorithms, or feeds. Your gratitude is a quiet sacred conversation with yourself.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.033),
                      height: 1.4,
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.widthPercent(0.08)),
          ],
        ),
      ),
    );
  }
}