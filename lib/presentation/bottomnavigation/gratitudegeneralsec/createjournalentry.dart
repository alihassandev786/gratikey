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

class CreateJournalEntryScreen extends StatefulWidget {
  const CreateJournalEntryScreen({super.key});

  @override
  State<CreateJournalEntryScreen> createState() => _CreateJournalEntryScreenState();
}

class _CreateJournalEntryScreenState extends State<CreateJournalEntryScreen> {
  final JournalController controller = Get.find<JournalController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.053)),
            child: Appheader(
              title: "Create New Entry",
              showBackButton: true,
              onBack: () => Get.back(),
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

                  /// TODAY'S DATE
                  Text(
                    controller.formattedToday,
                    style:  TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.height*0.018,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: AppSize.widthPercent(0.06)),

                  /// TODAY'S FOCUS (reactive quote + refresh)
                  Obx(
                        () => FocusQuoteCard(
                      title: "Today's Focus",
                      quote: controller.focusPromptText,
                      onRefresh: controller.refreshFocusPrompt,
                    ),
                  ),

                  SizedBox(height: AppSize.widthPercent(0.06)),

                  /// WRITE AREA
                  EntryTextField(
                    controller: controller.entryTextController,
                    hintText: "Pour your heart, reflections, and gratitude freely here…",
                  ),

                  SizedBox(height: AppSize.widthPercent(0.06)),
                ],
              ),
            ),
          ),

          /// SAVE ENTRY
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSize.widthPercent(0.053),
              0,
              AppSize.widthPercent(0.053),
              AppSize.widthPercent(0.05),
            ),
            child: CustomButton(
                title: "Save Entry",
                onTap: controller.saveEntry,
              ),
            ),
        ],
      ),
    );
  }
}