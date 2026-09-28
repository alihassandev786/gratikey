import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/bottomnavigation/bottomnavigation/bottombar.dart';


class BottomNavController extends GetxController {
  /// ---------------- TAB STATE ----------------
  /// 0 = Home, 1 = Keys, 2 = Journal (Gratitude), 3 = Breath, 4 = Profile
  var currentIndex = 0.obs;

  /// ---------------- BAR ITEMS ----------------
  final List<BottomBarItem> items = const [
    BottomBarItem(icon: Icons.home_rounded, label: "Home"),
    BottomBarItem(icon: Icons.key_rounded, label: "Keys"),
    BottomBarItem(icon: Icons.menu_book_rounded, label: "Journal"),
    BottomBarItem(icon: Icons.air_rounded, label: "Breath"),
    BottomBarItem(icon: Icons.person_rounded, label: "Profile"),
  ];

  /// ---------------- ACTIONS ----------------
  /// Kisi bhi screen se tab badalne ke liye:
  /// Get.find<BottomNavController>().changeTab(1);
  void changeTab(int index) {
    if (index == currentIndex.value) return;
    FocusManager.instance.primaryFocus?.unfocus();
    currentIndex.value = index;
  }

  void goToHome() => changeTab(0);

  bool get isHome => currentIndex.value == 0;
}