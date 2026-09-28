import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/journalcontroller.dart';
import 'gratitudegeneralsecwidgets/entrymetarow.dart';
import 'gratitudegeneralsecwidgets/entrytextfield.dart';
import 'gratitudegeneralsecwidgets/focusquotecard.dart';

/// NOTE: reference design ke header mein bhi "Create New Entry" likha tha,
/// yahan sahi UX flow ke mutabiq "Edit Entry" title rakha gaya hai
/// (button "Save Changes" hai — jo edit action ko clearly reflect karta hai).
class EditJournalEntryScreen extends StatefulWidget {
  const EditJournalEntryScreen({super.key});

  @override
  State<EditJournalEntryScreen> createState() => _EditJournalEntryScreenState();
}

class _EditJournalEntryScreenState extends State<EditJournalEntryScreen> {
  final JournalController controller = Get.find<JournalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final DateTime entryDate =
          (controller.selectedEntry.value?["date"] as DateTime?) ?? DateTime.now();

      return AppBackground(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
              child: Appheader(
                title: "Edit Entry",
                showBackButton: true,
                onBack: () => Get.back(),
                titleSize: AppSize.height * 0.024,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.widthPercent(0.05)),

                    /// "Key Reflection" + meta pill
                    EntryMetaRow(
                      label: controller.keyReflectionLabel,
                      meta: controller.promptMeta,
                    ),

                    SizedBox(height: AppSize.widthPercent(0.045)),

                    /// ENTRY'S ORIGINAL DATE
                    Text(
                      controller.formattedDateWithDay(entryDate),
                      style:  TextStyle(
                        fontFamily: "pm",
                        fontSize: AppSize.height*0.018,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: AppSize.widthPercent(0.06)),

                    /// TODAY'S FOCUS (reactive quote + refresh)
                    FocusQuoteCard(
                      title: "Today's Focus",
                      quote: controller.focusPromptText,
                      onRefresh: controller.refreshFocusPrompt,
                    ),

                    SizedBox(height: AppSize.widthPercent(0.06)),

                    /// WRITE AREA (pre-filled + edit indicator icon)
                    EntryTextField(
                      controller: controller.entryTextController,
                      hintText: "Pour your heart, reflections, and gratitude freely here…",
                      showEditIcon: true,
                    ),

                    SizedBox(height: AppSize.widthPercent(0.06)),
                  ],
                ),
              ),
            ),

            /// SAVE CHANGES
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSize.widthPercent(0.053),
                0,
                AppSize.widthPercent(0.053),
                AppSize.widthPercent(0.05),
              ),
              child: CustomButton(
                title: "Save Changes",
                onTap: controller.updateEntry,
              ),
            ),
          ],
        ),
      );
    });
  }
}