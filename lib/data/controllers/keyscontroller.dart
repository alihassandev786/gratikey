import 'package:get/get.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';
import 'package:gratikey/presentation/bottomnavigation/keyssection/keys.dart';

import '../../core/widgets/appnavigator.dart';
import '../../presentation/bottomnavigation/keyssection/digitalring.dart';
import '../../presentation/bottomnavigation/keyssection/keydetail.dart';
import '../../presentation/bottomnavigation/keyssection/lockedpremium.dart';
import '../../presentation/bottomnavigation/keyssection/progress.dart';

/// Har key card ka status — isi se Keys list, Digital Ring aur Progress
/// screen decide karte hain ke card kaisa dikhna/behave karna hai.
enum KeyStatus { completed, inProgress, upcoming }

/// Ek single Key (01 - 12) ka poora data (Keys list screen).
class KeyItemData {
  final int number;
  final String title;
  final String callToAction;
  final KeyStatus status;

  const KeyItemData({
    required this.number,
    required this.title,
    required this.callToAction,
    required this.status,
  });
}

/// Locked Premium screen ki "What Premium Unlocks?" list ka ek item.
class PremiumFeature {
  final String title;
  final String description;

  const PremiumFeature({required this.title, required this.description});
}

/// Key Detail screen ke "Progress" checklist ka ek item.
class KeyProgressStep {
  final String label;
  final bool completed;

  const KeyProgressStep({required this.label, this.completed = true});
}

/// Progress screen ki "Weekly Cadence" row ka ek din.
class CadenceDay {
  final String label; // M T W T F S S
  final bool done;
  final bool isToday;
  final bool isGoal;

  const CadenceDay({
    required this.label,
    this.done = false,
    this.isToday = false,
    this.isGoal = false,
  });
}

/// Progress screen ke "Digital Key Ring" preview ka ek mini card.
class RingKeyMini {
  final int number;
  final String label;
  final String day;

  const RingKeyMini({
    required this.number,
    required this.label,
    required this.day,
  });
}

/// -----------------------------------------------------------------------
/// KEYS SECTION CONTROLLER
/// Keys list, Key Detail, Locked Premium, Digital Ring aur Progress —
/// in paanchon screens ka ek hi common controller (Home section ke
/// HomeController jaisa pattern). Keys() tab (bottom nav) mein Get.put
/// hota hai, baaki 4 screens Get.find se isi instance ko use karti hain.
/// -----------------------------------------------------------------------
class KeysController extends GetxController {
  // ======================================================================
  // 12 KEYS DATA (keys.dart — "My 12 Keys Journey")
  // ======================================================================
  final String journeyTitle = "My 12 Keys Journey";
  final String journeySubtitle = "A guided journey of gratitude and purpose.";

  final String freeTierBadge = "Free Tier Sanctuary";
  final String freeTierDescription =
      "Explore key 1 freely. Upgrade Premium to unlock keys 2 through 12, guided audio teachings, and lifetime journey archives.";
  final String unlockBannerButton = "Unlock full 12 Keys Journey";

  final List<KeyItemData> keysList = const [
    KeyItemData(
      number: 1,
      title: "Admit your powerlessness over people,places and things",
      callToAction:
      "Where is what you cannot control most visible in your life today, and what is it teaching you? Let acceptance guide what you write.",
      status: KeyStatus.completed,
    ),
    KeyItemData(
      number: 2,
      title: "Embrace a Power Greater than Yourself",
      callToAction:
      "Where is support beyond your own strength most visible in your life today, and what is it teaching you? Let hope and openness guide what you write.",
      status: KeyStatus.inProgress,
    ),
    KeyItemData(
      number: 3,
      title: "Surrender to Your Higher Power",
      callToAction:
      "Where is the outcome you are being invited to surrender most visible in your life today, and what is it teaching you? Let trust guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 4,
      title: "Take Your Personal Inventory",
      callToAction:
      "Where are your patterns, strengths, and growing edges most visible in your life today, and what is it teaching you? Let honest self-examination guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 5,
      title:
      "Admit to Yourself, Your Higher Power, and Another Human Being the Ways Your Character Defects Hinder You from Experiencing the Joy of Gratitude",
      callToAction:
      "Where is a truth that needs a safe and honest voice most visible in your life today, and what is it teaching you? Let honest admission guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 6,
      title:
      "Get Ready to Ask Your Higher Power to Remove Character Defects That Keep You from Experiencing the Joy of Gratitude",
      callToAction:
      "Where is a habit or character pattern you are ready to change most visible in your life today, and what is it teaching you? Let willingness guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 7,
      title:
      "Embrace the Humility to Let Go of Character Defects That Hinder You from Experiencing Gratitude",
      callToAction:
      "Where is an opportunity for humility to soften your response most visible in your life today, and what is it teaching you? Let humility guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 8,
      title:
      "Make Amends and Forgive Yourself for the Opportunities You Missed to Express Gratitude",
      callToAction:
      "Where is a relationship or memory that needs repair most visible in your life today, and what is it teaching you? Let amends and self-forgiveness guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 9,
      title: "Make Living Amends a Part of Your Gratitude Journey",
      callToAction:
      "Where are the values you want your daily behavior to demonstrate most visible in your life today, and what is it teaching you? Let living amends guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 10,
      title:
      "Review Your Personal Inventory Regularly, and When You Miss Opportunities to Experience Gratitude, Promptly Admit It",
      callToAction:
      "Where are today's choices, reactions, and impact most visible in your life today, and what is it teaching you? Let daily review and prompt admission guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 11,
      title:
      "Use Prayer and Meditation to Build on and Cultivate the New Way You See the World",
      callToAction:
      "Where is your relationship with prayer, meditation, and inner stillness most visible in your life today, and what is it teaching you? Let prayer and meditation guide what you write.",
      status: KeyStatus.upcoming,
    ),
    KeyItemData(
      number: 12,
      title:
      "Share the Message of Gratitude, and Grow with the New Way the World Sees You",
      callToAction:
      "Where is the encouragement, experience, or service you can offer most visible in your life today, and what is it teaching you? Let service and encouragement guide what you write.",
      status: KeyStatus.upcoming,
    ),
  ];

  /// "3 of 12 Keys Collected" -> 25%
  double get journeyProgress => 3 / 12;

  // ======================================================================
  // KEY DETAIL (keydetail.dart)
  // TODO: jab list se dynamic key kholni ho to selectedKeyIndex ke mutabiq
  // API se us key ka data fetch kar ke neeche wali fields update karni hain.
  // ======================================================================
  var selectedKeyIndex = 1.obs; // Key 2 (design ke mutabiq default)

  final String detailKeyTitle = "Key 2: Unfolding Acceptance";
  final String detailKeyQuote =
      "\u201CSlowing the pulse of urgency to behold the quiet gifts hidden in the present\u201D";

  final String overviewTitle = "Current Key Overview";
  final String overviewText =
      "This Key provides a restorative threshold between stress and discernment. By creating a conscious breath before every reaction, you activate perceptual space \u2014transforming reflexive panic into calm, grounded thanksgiving.";

  final String teachingParagraph1 =
      "Gratitude is not merely an emotional reward for pleasant circumstances; it is an intentional stance.";
  final String teachingParagraph2 =
      "When an unhurried pause precedes your speech, habitual anxiety dissolves. Perspective widens, allowing you to recognize grace already present in the room before needing to demand.";

  final String audioTitle = "Listen to Guided Audio";
  final String audioSubtitle = "4:20 mins. Meditative Narration";

  final String inquiryPromptTitle = "Inquiry Prompt";
  final String inquiryPromptText =
      "\u201CHow does pausing before reacting allow gratitude to reshape your response today?\u201D";
  final String journalButtonText = "Open in Journal Sanctuary";

  final String actionStepText =
      "Identify one moment today where you feel rushed. Take 3 deep breaths and name one unearned blessing in that exact moment.";
  var actionStepMarked = false.obs;

  final List<KeyProgressStep> detailProgressSteps = const [
    KeyProgressStep(label: "Teaching", completed: true),
    KeyProgressStep(label: "Reflection", completed: true),
    KeyProgressStep(label: "Action", completed: true),
  ];

  void toggleActionStep() => actionStepMarked.value = !actionStepMarked.value;

  void playGuidedAudio() {
    // TODO: audio player integrate karna hai (audioplayers / just_audio se)
  }

  void openJournalSanctuary() {
    // TODO: Journal/Gratitude tab par navigate karna hai
  }

  void completeKey() {
    // TODO: API - key complete mark karna hai
    AppNavigator.push(ProgressScreen());
  }

  // ======================================================================
  // LOCKED PREMIUM (lockedpremium.dart)
  // ======================================================================
  final String premiumTitle = "Premium 12 Keys Journey";
  final String premiumDescription =
      "You\u2019ve made meaningful progress on your gratitude path. Unlock this key.";
  final String premiumSectionTitle = "What Premium Unlocks?";

  final List<PremiumFeature> premiumFeatures = const [
    PremiumFeature(
      title: "Full 12 Keys Journey",
      description:
      "Complete Keys 1 through 12 at your own pace without pauses.",
    ),
    PremiumFeature(
      title: "Deeper Guided Practice",
      description:
      "Complete Keys 1 through 12 at your own pace without pauses.",
    ),
    PremiumFeature(
      title: "Unlimited Private Reflection",
      description:
      "Complete Keys 1 through 12 at your own pace without pauses.",
    ),
    PremiumFeature(
      title: "Transformation Challenges",
      description:
      "Complete Keys 1 through 12 at your own pace without pauses.",
    ),
    PremiumFeature(
      title: "Sanctuary Circles",
      description:
      "Complete Keys 1 through 12 at your own pace without pauses.",
    ),
  ];

  void unlockPremium() {
    // TODO: In-App Purchase / API - premium unlock karna hai
  }

  void viewMembershipOptions() {
    // TODO: membership/plans screen par navigate karna hai
  }

  // ======================================================================
  // DIGITAL RING (digitalring.dart)
  // ======================================================================
  final String ringTag = "Brass & Amber Ring Tension: Balance";
  final int ringTotalKeys = 12;
  var ringUnlockedCount = 3.obs;
  var ringActiveKeyNumber = 1.obs;
  var ringActiveKeyPercent = 100.obs;

  final String initiationTag = "Initiation Pathway";
  String get initiationLabel =>
      "${ringUnlockedCount.value} of $ringTotalKeys Keys Collected";
  double get initiationProgress => ringUnlockedCount.value / ringTotalKeys;

  final String activeKeyCardTitle = "Key 03: Sacred Reciprocity";
  final String activeKeyCardText =
      "75% Mastered. Next golden key ready to forge upon your evening reflection.";
  final String continueActiveKeyLabel = "Continue Active Key 4";

  /// Ring rotate animation ke liye current angle (degrees).
  var ringRotation = 0.0.obs;

  void rotateRing() {
    ringRotation.value += (360 / ringTotalKeys);
  }

  void continueActiveKey() {
    selectedKeyIndex.value = 3; // Key 4
    AppNavigator.push(BottomNavigationScreen());
  }

  // ======================================================================
  // PROGRESS (progress.dart)
  // ======================================================================
  final String progressBannerTag = "Present Rhythm";
  final String progressBannerImage = "assets/images/precticeintro.png";
  final String progressBannerTitle = "Awakening Presence";
  final String progressBannerText =
      "Your daily rhythm holds space for patience, perspective and inner stillness";

  final String cadenceTag = "Rhythm & Rest";
  final String cadenceTitle = "Weekly Cadence";
  final List<CadenceDay> weeklyCadence = const [
    CadenceDay(label: "M", done: true),
    CadenceDay(label: "T", done: true),
    CadenceDay(label: "W", done: true),
    CadenceDay(label: "T", done: true),
    CadenceDay(label: "F", isToday: true),
    CadenceDay(label: "S", done: true),
    CadenceDay(label: "S", isGoal: true),
  ];

  final String masteryTag = "Mastery Path";
  final int masteredKeys = 3;
  final int totalKeysCount = 12;
  double get overallJourneyProgress => masteredKeys / totalKeysCount;
  String get overallJourneyLabel =>
      "${(overallJourneyProgress * 100).round()}% Complete";

  final String nowUnlockingTag = "Now Unlocking";
  final String nowUnlockingTitle = "Key 04: The Anchor of...";

  final String ringSectionTitle = "Digital Key Ring";
  final String ringSectionText =
      "Your earned keys unlock lifelong emotional resilience and intuitive calm.";

  final List<RingKeyMini> ringMiniKeys = const [
    RingKeyMini(number: 1, label: "Awakening", day: "Day 7"),
    RingKeyMini(number: 2, label: "Deep Root", day: "Day 8"),
    RingKeyMini(number: 3, label: "Gentle", day: "Day 11"),
  ];

  final String viewFullRingLabel = "View Full Ring";

  // ======================================================================
  // NAVIGATION
  // ======================================================================
  void goToKeyDetail(int index) {
    selectedKeyIndex.value = index;
    AppNavigator.push(KeyDetailScreen());
  }

  void goToLockedPremium() => AppNavigator.push(LockedPremiumScreen());

  void goToDigitalRing() => AppNavigator.push(DigitalRingScreen());

  void goToProgress() => AppNavigator.push(ProgressScreen());

  /// Keys list mein card tap hone par: unlocked/active key ho to Key Detail,
  /// warna (abhi tak locked) Premium screen khulti hai.
  void openKeyFromList(KeyItemData key, int index) {
    if (key.status == KeyStatus.upcoming) {
      goToLockedPremium();
    } else {
      goToKeyDetail(index);
    }
  }
}