import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/faithprefrence.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/reminderprefrence.dart';

/// Faith Preferences + Reminder Preferences ka controller
class PreferencesController extends GetxController {
  // ---------------- FAITH PREFERENCES ----------------
  /// 0 = Faith Based, 1 = General, 2 = Both
  var selectedFaithOption = 0.obs;

  final faithOptions = [
    {
      "icon": Icons.menu_book_rounded,
      "title": "Faith Based Content",
      "subtitle":
      "Daily Reflections, scripture verses, and spiritual encouragement.",
    },
    {
      "icon": Icons.wb_sunny_outlined,
      "title": "General Inspirational Content",
      "subtitle":
      "Universal wisdom, mindfulness reflections, personal growth insights.",
    },
    {
      "icon": Icons.wb_sunny_outlined,
      "title": "Both",
      "subtitle":
      "A harmonious blend of scriptural faith-based wisdom through week.",
    },
  ];

  // ---------------- REMINDER PREFERENCES ----------------
  var pauseAllReminders = false.obs;
  var morningGratitude = true.obs;
  var middayBreathing = true.obs;
  var eveningReflection = false.obs;

  final morningTime = "07:30 AM";
  final middayTime = "12:45 PM";
  final eveningTime = "09:00 PM";

  // ---------------- ACTIONS ----------------
  void goToFaithPreferences() =>
      AppNavigator.push(const FaithPreferenceScreen());
  void goToReminderPreferences() =>
      AppNavigator.push(const DailyReminderPreferenceScreen());

  void selectFaithOption(int index) => selectedFaithOption.value = index;

  void togglePauseAll() => pauseAllReminders.value = !pauseAllReminders.value;
  void toggleMorning() => morningGratitude.value = !morningGratitude.value;
  void toggleMidday() => middayBreathing.value = !middayBreathing.value;
  void toggleEvening() => eveningReflection.value = !eveningReflection.value;

  void saveFaithPreferences() {
    // TODO: Save to local / API
    AppNavigator.clear(BottomNavigationScreen());
  }

  void saveReminders() {
    // TODO: Save to local / API
    AppNavigator.clear(BottomNavigationScreen());
  }
}
