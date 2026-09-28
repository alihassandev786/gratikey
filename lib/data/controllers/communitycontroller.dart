import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appnavigator.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/bottomnavigation.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/blockuserconfirmation.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/communityguidelines.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/communitywall.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/reportcontentflow.dart';

import '../../presentation/bottomnavigation/profilesection/discussionandcommint.dart';
import '../../presentation/bottomnavigation/profilesection/muteuserconfirmaton.dart';

/// Community related screens ka single controller
/// (Wall, Discussion, Block, Mute, Report, Guidelines)
class CommunityController extends GetxController {
  // ---------------- COMMUNITY WALL DATA ----------------
  final featuredPost = {
    "name": "Stacy",
    "role": "Gratikey Guide",
    "time": "Posted yesterday",
    "tag": "Weekly Gathering",
    "quote":
    "“When in your day do you feel the most unhurried stillness, and how does that quiet moment open your eyes to gratitude?”",
    "image": "assets/images/profile.png",
  };

  final List<Map<String, String>> reflections = [
    {
      "name": "Elena R.",
      "time": "3h ago",
      "text":
      "You are always in control of your sanctuary. Easily report content, block members, or mute comments with one tap.",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Marcus K.",
      "time": "3h ago",
      "text":
      "You are always in control of your sanctuary. Easily report content, block members, or mute comments with one tap.",
      "image": "assets/images/profile.png",
    },
    {
      "name": "John B.",
      "time": "3h ago",
      "text":
      "You are always in control of your sanctuary. Easily report content, block members, or mute comments with one tap.",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Elena R.",
      "time": "3h ago",
      "text":
      "You are always in control of your sanctuary. Easily report content, block members, or mute comments with one tap.",
      "image": "assets/images/profile.png",
    },
  ];

  // ---------------- DISCUSSION ----------------
  final discussionQuote =
      "“When in your day do you feel the most unhurried stillness, and how does that quiet moment open your eyes to gratitude?”";
  final discussionMeta = "October 25. Guided Community Inquiries";
  final discussionFooter = "A communal space of pure presence & reverence";

  final reflectionController = TextEditingController();

  // ---------------- REPORT ----------------
  var selectedReportReason = 0.obs;
  final reportReasons = [
    {
      "title": "Inappropriate or Harassing Lang",
      "subtitle": "Disrespectful tones, insults or disturbing sentiments.",
    },
    {
      "title": "Commercial Promotion or Spam",
      "subtitle": "Advertisement, Unsolicited links, or repetitive text.",
    },
    {
      "title": "Medical, Clinical Advice",
      "subtitle": "Urgent care needs or unverified psychiatric counsel.",
    },
    {
      "title": "Other Violation of Community Peace",
      "subtitle": "Breaks the gentle, meditative spirit of the Gratikey.",
    },
  ];
  final reportDetailsController = TextEditingController();

  // ---------------- BLOCK / MUTE ----------------
  final String targetUserName = "Stacy T.";
  final String targetUserImage = "assets/images/profile.png";

  // ---------------- GUIDELINES ----------------
  var agreedToGuidelines = true.obs;

  final guidelines = [
    {
      "icon": Icons.eco_outlined,
      "title": "Curated & Actively Moderated",
      "subtitle":
      "Every prompt is guided by our team, and discussions are gently moderated to nurture a peaceful, uplifted environment.",
    },
    {
      "icon": Icons.tune_rounded,
      "title": "Member Safety Controls",
      "subtitle":
      "You are always in control of your sanctuary. Easily report content, block members, or mute comments with one tap.",
    },
    {
      "icon": Icons.health_and_safety_outlined,
      "title": "Not Medical or Crisis Care",
      "subtitle":
      "GratiKey™ is a personal gratitude and mindfulness practice. It does not provide medical treatment, psychiatric therapy, or crisis counseling.",
    },
    {
      "icon": Icons.lock_outline_rounded,
      "title": "Private Journal Remains Private",
      "subtitle":
      "Your personal journal entries and voice reflections are strictly on-device and encrypted. Nothing from your journal is ever shared to the community.",
    },
    {
      "icon": Icons.favorite_outline_rounded,
      "title": "Respectful, Heart Discoursed",
      "subtitle":
      "Every prompt is guided by our team, and discussions are gently moderated to nurture a peaceful, uplifted environment.",
    },
  ];

  // ---------------- ACTIONS ----------------
  void goToCommunityWall() => AppNavigator.push(const CommunityWall());
  void goToDiscussion() => AppNavigator.push(const DiscussionAndComments());
  void goToBlockConfirmation() =>
      AppNavigator.push(const BlockUserConfirmation());
  void goToMuteConfirmation() =>
      AppNavigator.push(const MuteUserConfirmation());
  void goToReport() => AppNavigator.push(const ReportContentFlow());
  void goToGuidelines() => AppNavigator.push(const CommunityGuidelines());

  void selectReportReason(int index) => selectedReportReason.value = index;

  void toggleGuidelinesAgree() =>
      agreedToGuidelines.value = !agreedToGuidelines.value;

  void postReflection() {
    // if (reflectionController.text.trim().isEmpty) return;
    // // TODO: API call
    // reflectionController.clear();
    AppNavigator.clear(BottomNavigationScreen());
  }

  void submitReport() {
    // TODO: API call
    AppNavigator.clear(BottomNavigationScreen());
  }

  void blockMember() {
    // TODO: API call
    AppNavigator.clear(BottomNavigationScreen());
  }

  void muteMember() {
    // TODO: API call
  AppNavigator.clear(BottomNavigationScreen());
}

  void continueToCommunity() {
    if (!agreedToGuidelines.value) return;
    AppNavigator.push(const CommunityWall());
  }

  @override
  void onClose() {
    reflectionController.dispose();
    reportDetailsController.dispose();
    super.onClose();
  }
}