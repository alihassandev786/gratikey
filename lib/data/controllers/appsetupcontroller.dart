import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/presentation/auth/signup.dart';
import 'package:gratikey/presentation/others/content.dart';
import 'package:gratikey/presentation/others/welcome.dart';
import '../../core/widgets/appnavigator.dart';
import '../../presentation/auth/login.dart';

class AppSetupController extends GetxController {
  /// ---------------- CONTENT PREFERENCES ----------------
  final List<Map<String, dynamic>> contentOptions = [
    {
      "title": "Faith Based Content",
      "subtitle":
      "Daily Reflections, scripture verses, and spiritual encouragment.",
      "icon": Icons.menu_book_rounded,
    },
    {
      "title": "General Inspirational Content",
      "subtitle":
      "Universal wisdom, mindfulness reflections, personal growth insights.",
      "icon": Icons.wb_sunny_rounded,
    },
    {
      "title": "Both",
      "subtitle":
      "A harmonious blend of scriptural faith-based wisdom through week.",
      "icon": Icons.brightness_5_rounded,
    },
  ];

  /// Default: Faith Based Content (design mein selected dikhaya gaya hai)
  var selectedContentPreference = 0.obs;

  void selectContentPreference(int index) {
    selectedContentPreference.value = index;
  }

  /// ---------------- REMINDER PREFERENCES ----------------
  final List<Map<String, dynamic>> reminderOptions = [
    {"title": "Morning Gratitude Prompt", "icon": Icons.wb_twilight_rounded},
    {"title": "Midday Breathing", "icon": Icons.air_rounded},
    {"title": "Evening Reflection", "icon": Icons.nightlight_round},
  ];

  var reminderEnabled = <bool>[true, true, true].obs;
  var reminderTime = <String>["07:30 AM", "12:45 PM", "09:00 PM"].obs;

  void toggleReminder(int index) {
    reminderEnabled[index] = !reminderEnabled[index];
  }

  /// Time card par tap karke system time-picker se time update kiya ja sakta hai
  Future<void> pickReminderTime(BuildContext context, int index) async {
    final TimeOfDay initial = _parseTime(reminderTime[index]);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );
    if (picked != null) {
      reminderTime[index] = picked.format(context);
    }
  }

  TimeOfDay _parseTime(String time) {
    try {
      final parts = time.split(RegExp(r'[:\s]'));
      int hour = int.parse(parts[0]);
      final int minute = int.parse(parts[1]);
      final String period = parts[2].toUpperCase();
      if (period == "PM" && hour != 12) hour += 12;
      if (period == "AM" && hour == 12) hour = 0;
      return TimeOfDay(hour: hour, minute: minute);
    } catch (_) {
      return TimeOfDay.now();
    }
  }

  /// ---------------- NAVIGATION ----------------
  /// NOTE: apni signup.dart / login.dart / bottomnavigation.dart ki
  /// actual class names yahan match kar lein agar different hon.
  void goToLogin() => AppNavigator.push(LoginScreen());

  void goToSignup() => AppNavigator.push( SignUpScreen());

  void saveContentPreference() {
    AppNavigator.push(
      WelcomeScreen(),
    );

  }

  void continueToJournal() =>
       AppNavigator.push(ContentPreferencesScreen());
}