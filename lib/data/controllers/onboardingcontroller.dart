import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/presentation/others/reminder.dart';
import '../../core/widgets/appnavigator.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  /// ---------------- ONBOARDING DATA ----------------
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Three Minutes for\nGratitude",
      "subTitle":
      'Pause. Reflect. Be grateful. Embrace each moment and find peace every day.',
      "image": "assets/images/onb1.png",
    },
    {
      "title": "Pause. Reflect.\nBreathe.",
      "subTitle":
      "Reflect with gratitude and guided breathing to restore calm.",
      "image": "assets/images/onb2.png",
    },
    {
      "title": "Unlock Your 12\nKeys",
      "subTitle":
      "Progress through 12 Keys, build resilience, and earn golden badges.",
      "image": "assets/images/onb3.png",
    },
  ];

  /// Last page check — button text isi par depend karta hai
  bool get isLastPage => currentPage.value == onboardingData.length - 1;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  /// Slide button complete hone par call hota hai
  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    } else {
      // Onboarding complete -> Login screen (stack clear taake wapas na aa sake)
      AppNavigator.push( ReminderPreferencesScreen());
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}