import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/bottomnavigationcontroller.dart';
import '../breathsection/breath.dart';
import '../gratitudegeneralsec/gratitudegeneral.dart';
import '../homesection/home.dart';
import '../keyssection/keys.dart';
import '../profilesection/profile.dart';
import 'bottombar.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final BottomNavController controller = Get.find<BottomNavController>();

  /// Tab screens — order controller ke `items` ke barabar hona chahiye.
  /// NOTE: in class names ko apni screens ki actual class names se match kar lein.
  final List<Widget> pages = [
    Home(),
    Keys(),
    Gratitudegeneral(),
    Breath(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => PopScope(
        // Home par ho to app se bahar, warna back dabane par pehle Home tab
        canPop: controller.currentIndex.value == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) controller.goToHome();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,     // ← yeh change
          extendBody: true,
          /// IndexedStack: tab badalne par har screen ki state (scroll, text) bachi rehti hai
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: pages,
          ),

          bottomNavigationBar: AppBottomBar(
            items: controller.items,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            // Apni image lagane ke liye yahan path de dein:
             backgroundImage: 'assets/images/bottomnavbg.png',
          ),
        ),
      ),
    );
  }
}