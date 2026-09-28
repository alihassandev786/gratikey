import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';
import 'package:gratikey/presentation/bottomnavigation/gratitudegeneralsec/createjournalentry.dart';
import 'package:gratikey/presentation/bottomnavigation/gratitudegeneralsec/editjournalentry.dart';
import 'package:gratikey/presentation/bottomnavigation/gratitudegeneralsec/journalentrydetail.dart';

/// Gratitude Journal section (List + Create + Edit + Detail) ka ek hi controller.
/// AppBinding mein `permanent: true` register kar dena behtar rahega taake
/// tabs switch hone par entries/state maintain rahen (Home/BottomNav pattern jaisa).
class JournalController extends GetxController {
  // ==================== FREE / PREMIUM LIMIT ====================
  final int freeEntryLimit = 3;
  var isPremium = false.obs;

  bool get limitReached => !isPremium.value && entries.length >= freeEntryLimit;

  // ==================== JOURNAL DATA ====================
  /// Har entry: {id, date (DateTime), text (String), tag (String), guidance (String)}
  /// TODO: API/local-storage se real entries load karein; abhi mock data hai.
  var entries = <Map<String, dynamic>>[
    {
      "id": 1,
      "date": DateTime(2026, 10, 24),
      "text": "I am grateful for the quiet early morning light streaming through the kitchen window, hearing the birds outside before the house wakes up. There is a peaceful rhythm in brewing coffee slowly.",
      "tag": "Private Prayer",
      "guidance": "Identify one moment today where you feel rushed. Take 3 deep breaths and name one unearned blessing in that exact moment.",
    },
    {
      "id": 2,
      "date": DateTime(2026, 10, 25),
      "text": "The gentle sun filtering through the kitchen window while the tea kettle warmed felt like an unmerited gift. In that stillness before the house awoke, I realized I did not have to earn the light or strive for quietness; it was simply there, ready to embrace the day with me.\n\nWhen I rushed through yesterday, I missed these moments. Today, I am choosing to anchor my heart in gratitude for quiet mornings, warm tea, and the breath in my lungs. God is in the stillness as much as in the storm.",
      "tag": "Private Prayer",
      "guidance": "Identify one moment today where you feel rushed. Take 3 deep breaths and name one unearned blessing in that exact moment.",
    },
  ].obs;

  /// List/Detail/Edit screens ke darmiyan currently open entry share karne ke liye.
  Rxn<Map<String, dynamic>> selectedEntry = Rxn<Map<String, dynamic>>();

  // ==================== TODAY'S FOCUS (Gratitude Prompt) ====================
  final String keyReflectionLabel = "Key Reflection";
  final String promptMeta = "Morning Quiet. 7:42AM";

  final List<String> focusPrompts = [
    "What unearned grace brought light into your world this morning?",
    "Where did you experience an overlooked gift of kindness or ease today?",
    "What quiet moment today deserves a second, grateful look?",
  ];
  var focusIndex = 0.obs;

  String get focusPromptText => focusPrompts[focusIndex.value];

  void refreshFocusPrompt() {
    focusIndex.value = (focusIndex.value + 1) % focusPrompts.length;
  }

  // ==================== ENTRY TEXT (Create / Edit shared field) ====================
  final TextEditingController entryTextController = TextEditingController();

  // ==================== DATE HELPERS ====================
  static const List<String> _days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  static const List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  String get formattedToday => formattedDateWithDay(DateTime.now());

  String formattedDateWithDay(DateTime date) =>
      "${_days[date.weekday - 1]},${_months[date.month - 1]} ${date.day},${date.year}";

  // ==================== NAVIGATION + ACTIONS ====================

  /// List -> "+ New Entry"
  void goToCreateEntry() {
    // if (limitReached) {
    //   // TODO: yahan "Unlock Unlimited" / Subscription paywall dikhayein
    //   goToUnlockUnlimited();
    //   return;
    // }
    // entryTextController.clear();
    // focusIndex.value = 0;
    AppNavigator.push(const CreateJournalEntryScreen());
  }

  /// Create -> "Save Entry" -> wapas List
  void saveEntry() {
    // print("SAVE ENTRY CALLED");
    //
    // final String text = entryTextController.text.trim();
    //
    // print("TEXT = $text");
    //
    // if (text.isEmpty) {
    //   print("TEXT EMPTY");
    //   return;
    // }
    //
    // try {
    //   entries.insert(0, {
    //     "id": DateTime.now().millisecondsSinceEpoch,
    //     "date": DateTime.now(),
    //     "text": text,
    //     "tag": "Private Prayer",
    //     "guidance": "Identify one moment today where you feel rushed. Take 3 deep breaths and name one unearned blessing in that exact moment.",
    //   });
    //
    //   print("ENTRY INSERTED");
    //
    //   entryTextController.clear();
    //
    //   print("GOING TO BOTTOM NAV");
    //
    //   AppNavigator.clear(BottomNavigationScreen());
    // } catch (e) {
    //   print("ERROR: $e");
    // }
    AppNavigator.clear(BottomNavigationScreen());

  }

  /// List item "View Entry" -> Detail
  void goToEntryDetail(Map<String, dynamic> entry) {
    selectedEntry.value = entry;
    AppNavigator.push(const JournalEntryDetailScreen());
  }

  /// Detail -> "Edit Entry"
  void goToEditEntry() {
    final Map<String, dynamic>? current = selectedEntry.value;
    if (current == null) return;
    entryTextController.text = current["text"] as String;
    AppNavigator.push(const EditJournalEntryScreen());
  }

  /// Edit -> "Save Changes" -> wapas Detail
  void updateEntry() {
    final Map<String, dynamic>? current = selectedEntry.value;
    if (current == null) return;

    final String newText = entryTextController.text.trim();
    if (newText.isEmpty) return;

    final int index = entries.indexWhere((e) => e["id"] == current["id"]);
    if (index != -1) {
      entries[index] = {...entries[index], "text": newText};
      selectedEntry.value = entries[index];
    }
    // TODO: API - entry update karna
    AppNavigator.clear(BottomNavigationScreen());
  }

  /// Detail -> "Delete Entry" -> wapas List
  void deleteEntry() {
    final Map<String, dynamic>? current = selectedEntry.value;
    if (current == null) return;
    entries.removeWhere((e) => e["id"] == current["id"]);
    selectedEntry.value = null;
    // TODO: API - entry delete karna
    Get.back();
  }

  /// "Unlock Unlimited" -> Subscription/Paywall
  void goToUnlockUnlimited() {
    // TODO: profilesection/subcryption.dart ke Subscription screen se connect karein
  }

  @override
  void onClose() {
    entryTextController.dispose();
    super.onClose();
  }
}
