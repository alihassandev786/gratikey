import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/notifications.dart';

import '../../core/widgets/appnavigator.dart';
import '../../presentation/bottomnavigation/homesection/encourgamentandtakeway.dart';
import '../../presentation/bottomnavigation/homesection/gratitudeprompt.dart';
import '../../presentation/bottomnavigation/homesection/precticecomplete.dart';
import '../../presentation/bottomnavigation/homesection/precticeintro.dart';
import '../../presentation/bottomnavigation/homesection/reflectionwrite.dart';
import '../../presentation/bottomnavigation/homesection/stopandbreath.dart';
import 'bottomnavigationcontroller.dart';

/// Home tab + uski saari sub screens (Practice Intro, Gratitude Prompt,
/// Reflection Write/Voice, Just Stop & Breathe, Encouragement, Practice Complete)
/// ka ek hi controller. AppBinding mein `permanent: true` register hai.
class HomeController extends GetxController {
  // ====================================================================
  // ASSETS (apni images `assets/images/` mein in naamon se rakh dein)
  // ====================================================================
  final ImageProvider profileImage =
  const AssetImage('assets/images/profile.png');
  final String keyBannerImage = 'assets/images/home.png';
  final String practiceBannerImage = 'assets/images/precticeintro.png';
  final String breathBannerImage = 'assets/images/stopandbreath.png';
  final String fellowshipImage = 'assets/images/profile.png';

  // ====================================================================
  // HOME — USER + KEY JOURNEY
  // ====================================================================
  final String userName = "James";
  final String greeting = "Peace be with you";

  final int totalKeys = 12;
  final int unlockedKeys = 2;
  final int currentKey = 3;
  final String currentKeyTitle = "Gratitude in Small Things";

  String get keysProgressLabel =>
      "$unlockedKeys Unlocked. Key $currentKey Active.";

  final String teachingDuration = "2 min";
  final String teachingText =
      "\u201CTransformational gratitude begins not in monumental victories, but in the quiet noticing of ordinary grace.\u201D";
  final String reflectText =
      "Where did you experience an overlooked gift of kindness or ease during your morning routine?";
  final String actionText =
      "Acknowledge one small blessing silently before taking your next sip of water or tea.";

  // ====================================================================
  // HOME — TODAY'S PRACTICE
  // ====================================================================
  final String practiceBadge = "Today's 3-Minute Practice";
  final String practiceTitle = "Sacred Daily Centering";
  final String practiceSubtitle =
      "Four gentle, unhurried steps in harmony with key 3.";

  final List<Map<String, String>> practiceSteps = [
    {
      "title": "Gratitude Prompt",
      "subtitle": "\u201CWhat unexpected comfort met you when you needed it most?\u201D",
    },
    {
      "title": "Sacred Expression",
      "subtitle": "Express by writing / voice",
    },
    {
      "title": "Just Stop & Breathe",
      "subtitle": "60-second guided heart breathe",
    },
    {
      "title": "Daily Imprint",
      "subtitle": "Encouraging takeaway anchor",
    },
  ];

  /// 0 = Write, 1 = Voice (Home ka toggle aur Reflection screen ka toggle dono yahi use karte hain)
  var expressionMode = 0.obs;

  /// Home ke "Verse" toggle ki state.
  /// TODO: verse / non-verse content API ke saath connect karna hai.
  var verseEnabled = false.obs;

  void setExpressionMode(int index) => expressionMode.value = index;

  void toggleVerse() => verseEnabled.value = !verseEnabled.value;

  // ====================================================================
  // HOME — JOURNEY OF GRACE
  // ====================================================================
  final String journeyBadge = "Sustained With Compassion";
  final String journeyTitle = "A journey of Grace";
  final String completedKeyTitle = "Key 1 Complete";
  final String completedKeySubtitle = "Foundations of Presence";

  final String fellowshipLabel = "SANCTUARY FELLOWSHIP WISDOM";
  final String fellowshipQuote =
      "\u201CYou are plating quiet seeds of peace that blossom in their own sacred time.\u201D";
  final String fellowshipAuthor = "-Marcus, Fellowship Companion";

  // ====================================================================
  // PRACTICE INTRO
  // ====================================================================
  final String introTag = "3 mins. No Rush, Only Peace";
  final String introTitle = "Today's 3-Minute Practice";
  final String introDescription =
      "A gentle pause to unlock gratitude, center your spirit, and align your day in approximately 3 minutes.";
  final String introFlowTitle = "Sacred Flow";

  final List<Map<String, dynamic>> flowSteps = [
    {
      "title": "Gratitude",
      "time": "45 sec",
      "description":
      "Today's reflection prompt to center your focus and awaken reverence.",
      "icon": Icons.spa_rounded,
    },
    {
      "title": "Reflection",
      "time": "60 sec",
      "description":
      "Private space to capture your heart in writing or mindful voice note.",
      "icon": Icons.edit_rounded,
    },
    {
      "title": "Breathe",
      "time": "60 sec",
      "description":
      "1 minute of calming box breathing to still the mind and ground presence.",
      "icon": Icons.air_rounded,
    },
    {
      "title": "Encouragement",
      "time": "45 sec",
      "description":
      "Uplifting takeaway & grounding Scripture to carry into your day.",
      "icon": Icons.auto_awesome_rounded,
    },
  ];

  // ====================================================================
  // STEP 1 — GRATITUDE PROMPT
  // ====================================================================
  final String promptTag = "Morning Stillness";
  final String promptLabel = "Prompt of the Day";
  final String promptText =
      "What unearned grace brought light into your world this morning?";
  final String pacingTitle = "Gentle Pacing";
  final String pacingText =
      "Take a slow breath. Let the feeling of gratitude settle before you continue.";
  final String pacingHint = "Take 3 deep breaths";

  // ====================================================================
  // STEP 2 — REFLECTION (WRITE + VOICE)
  // ====================================================================
  final String writePromptLabel = "Morning Key Prompt";
  final String voicePromptLabel = "Grace In Dawn";

  final TextEditingController reflectionController = TextEditingController();

  final List<Map<String, dynamic>> moodOptions = [
    {"label": "Serene", "icon": Icons.self_improvement_rounded},
    {"label": "Humbled", "icon": Icons.wb_sunny_outlined},
  ];
  var selectedMoods = <String>[].obs;

  void toggleMood(String mood) {
    if (selectedMoods.contains(mood)) {
      selectedMoods.remove(mood);
    } else {
      selectedMoods.add(mood);
    }
  }

  // ---------------- Voice recording (UI simulation) ----------------
  // NOTE: Abhi sirf UI/timer/waveform chalta hai. Asli audio recording ke liye
  // baad mein `record` package + permissions jodni hongi (yahan TODO).
  var isRecording = false.obs;
  var hasRecording = false.obs;
  var recordSeconds = 0.obs;
  final RxList<double> waveform = List<double>.filled(16, 0.25).obs;

  Timer? _recordTimer;
  Timer? _waveTimer;
  final Random _random = Random();

  String get recordTimeText {
    final String m = (recordSeconds.value ~/ 60).toString().padLeft(2, '0');
    final String s = (recordSeconds.value % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  void toggleRecording() {
    if (isRecording.value) {
      _stopRecording();
    } else {
      _startRecording();
    }
  }

  void _startRecording() {
    // TODO: yahan asli recorder start karein
    isRecording.value = true;
    hasRecording.value = true;

    _recordTimer?.cancel();
    _recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      recordSeconds.value++;
    });

    _waveTimer?.cancel();
    _waveTimer = Timer.periodic(const Duration(milliseconds: 160), (_) {
      waveform.assignAll(
        List<double>.generate(16, (_) => 0.2 + _random.nextDouble() * 0.8),
      );
    });
  }

  void _stopRecording() {
    // TODO: yahan asli recorder stop karke file save karein
    _recordTimer?.cancel();
    _waveTimer?.cancel();
    isRecording.value = false;
    waveform.assignAll(List<double>.filled(16, 0.25));
  }

  void redoVoice() {
    _stopRecording();
    recordSeconds.value = 0;
    hasRecording.value = false;
  }

  // ====================================================================
  // STEP 3 — JUST STOP & BREATHE (box breathing)
  // ====================================================================
  final String breathTag = "Box Breathing Protocol";

  final List<Map<String, dynamic>> breathPhases = [
    {"name": "Inhale", "label": "Breathe In", "seconds": 4},
    {"name": "Hold", "label": "Hold", "seconds": 4},
    {"name": "Exhale", "label": "Breathe Out", "seconds": 4},
  ];
  final int breathCycles = 4;

  var breathCycle = 1.obs;
  var breathPhase = 0.obs;
  var phaseSecondsLeft = 4.obs;
  var breathRemaining = 48.obs;
  var isBreathing = false.obs;
  var breathFinished = false.obs;

  Timer? _breathTimer;

  int get _totalBreathSeconds {
    int sum = 0;
    for (final p in breathPhases) {
      sum += p["seconds"] as int;
    }
    return sum * breathCycles;
  }

  String get breathLabel {
    if (breathFinished.value) return "Well Done";
    return breathPhases[breathPhase.value]["label"] as String;
  }

  String get breathSecondsText =>
      breathFinished.value ? "" : "${phaseSecondsLeft.value}s";

  /// Inhale/Hold par circle bara, Exhale (ya start/finish) par chota
  double get breathScale =>
      (isBreathing.value && breathPhase.value < 2) ? 1.0 : 0.8;

  String get breathRemainingText {
    final int s = breathRemaining.value;
    return "${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')} remaining";
  }

  void startBreathing() {
    _breathTimer?.cancel();
    breathCycle.value = 1;
    breathPhase.value = 0;
    phaseSecondsLeft.value = breathPhases[0]["seconds"] as int;
    breathRemaining.value = _totalBreathSeconds;
    breathFinished.value = false;
    isBreathing.value = true;

    _breathTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _tickBreathing();
    });
  }

  void _tickBreathing() {
    if (breathRemaining.value > 0) breathRemaining.value--;

    if (phaseSecondsLeft.value > 1) {
      phaseSecondsLeft.value--;
      return;
    }

    // current phase khatam
    if (breathPhase.value < breathPhases.length - 1) {
      breathPhase.value++;
    } else if (breathCycle.value < breathCycles) {
      breathCycle.value++;
      breathPhase.value = 0;
    } else {
      // saare cycles complete
      stopBreathing();
      breathFinished.value = true;
      breathRemaining.value = 0;
      return;
    }
    phaseSecondsLeft.value = breathPhases[breathPhase.value]["seconds"] as int;
  }

  void stopBreathing() {
    _breathTimer?.cancel();
    isBreathing.value = false;
  }

  // ====================================================================
  // STEP 4 — ENCOURAGEMENT & TAKEAWAY
  // ====================================================================
  final String encouragementTag = "Morning Light";
  final String verseText =
      "Give thanks in all circumstances, for this is the will of God Jesus for you.";
  final String verseReference = "1 Thessalonians 5:18";
  final String insightLabel = "Grounded Insight";
  final String insightText =
      "Gratitude does not require ideal circumstances; it transforms your perspective within them. Carry this peace into the rest of your day.";

  // ====================================================================
  // PRACTICE COMPLETE
  // ====================================================================
  final String completeTitle = "Today's Practice Complete";
  final String completeSubtitle =
      "You unlocked 3 minutes of grounding, gratitude and peace today.";

  // ====================================================================
  // NAVIGATION
  // ====================================================================
  void goToNotifications() {
    // TODO: notifications.dart ka design aane par yahan push karein
    AppNavigator.push(NotificationsScreen());

  }

  /// "Continue Key 3 Journey" -> Keys tab
  void goToContinueKey() => Get.find<BottomNavController>().changeTab(1);

  /// Home -> Practice Intro
  void beginPractice() => AppNavigator.push(PracticeIntroScreen());

  /// Practice Intro -> Step 1
  void startPracticeFlow() => AppNavigator.push(GratitudePromptScreen());

  /// Step 1 -> Step 2
  void goToReflection() => AppNavigator.push(ReflectionWriteScreen());

  /// Step 2 -> Step 3
  void saveReflectionAndContinue() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (isRecording.value) _stopRecording();
    // TODO: API - reflection (text ya voice) save karna
    goToBreathe();
  }

  /// Step 3 (breathing timer shuru karke screen kholta hai)
  void goToBreathe() {
    startBreathing();
    AppNavigator.push(StopAndBreatheScreen());
  }

  /// Step 3 -> Step 4
  void finishBreathing() {
    stopBreathing();
    goToEncouragement();
  }

  /// Step 4 (Home ke "Daily Imprint" tile se bhi direct khulta hai)
  void goToEncouragement() => AppNavigator.push(EncouragementTakeawayScreen());

  /// Step 4 -> Practice Complete
  void completePractice() {
    // TODO: API - practice complete mark karna
    AppNavigator.push(PracticeCompleteScreen());
  }

  /// Practice Complete -> Home tab
  void returnToHome() {
    resetPractice();
    Get.until((route) => route.isFirst);
    AppNavigator.clear(BottomNavigationScreen());
  }
  /// Practice khatam hone par saari temporary state saaf
  void resetPractice() {
    stopBreathing();
    breathFinished.value = false;
    redoVoice();
    reflectionController.clear();
    selectedMoods.clear();
  }

  @override
  void onClose() {
    _recordTimer?.cancel();
    _waveTimer?.cancel();
    _breathTimer?.cancel();
    reflectionController.dispose();
    super.onClose();
  }
}
