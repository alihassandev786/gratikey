import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/dialoge.dart';

import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/journalcontroller.dart';
import 'gratitudegeneralsecwidgets/entrydetailcard.dart';
import 'gratitudegeneralsecwidgets/guidencecard.dart';

class JournalEntryDetailScreen extends StatefulWidget {
  const JournalEntryDetailScreen({super.key});

  @override
  State<JournalEntryDetailScreen> createState() =>
      _JournalEntryDetailScreenState();
}

class _JournalEntryDetailScreenState extends State<JournalEntryDetailScreen> {
  final JournalController controller = Get.find<JournalController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final Map<String, dynamic>? entry = controller.selectedEntry.value;

      return AppBackground(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthPercent(0.053)),
              child: Appheader(
                title: "Journal Entry Detail",
                showBackButton: true,
                onBack: () => Get.back(),
              ),
            ),

            Expanded(
              child: entry == null
                  ? const Center(child: Text("Entry not found"))
                  : SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.widthPercent(0.053)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.widthPercent(0.05)),

                    EntryDetailCard(
                      text: entry["text"] as String,
                      dateLabel: controller.formattedDateWithDay(
                        entry["date"] as DateTime,
                      ),
                    ),

                    SizedBox(height: AppSize.widthPercent(0.05)),

                    GuidanceCard(text: entry["guidance"] as String),

                    SizedBox(height: AppSize.widthPercent(0.08)),
                  ],
                ),
              ),
            ),

            if (entry != null)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSize.widthPercent(0.053),
                  0,
                  AppSize.widthPercent(0.053),
                  AppSize.widthPercent(0.05),
                ),
                child: Column(
                  children: [
                    CustomButton(
                      title: "Edit Entry",
                      onTap: controller.goToEditEntry,
                    ),
                    SizedBox(height: AppSize.widthPercent(0.035)),
                    CustomButton(
                      title: "Delete Entry",
                      onTap: () {
                        ConfirmDialog.show(title: "Delete Entry",
                            message: "Are you sure you want to permanently delete this entry? You won’t be able to recover it.",
                            onConfirm: (){
                          Get.back();
                            });
                      },
                      backgroundColor: const Color(0xff8B1414),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}