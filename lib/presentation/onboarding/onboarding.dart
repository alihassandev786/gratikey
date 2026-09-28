import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';

import '../../core/widgets/background.dart';
import '../../core/widgets/mediaquery.dart';
import '../../data/controllers/onboardingcontroller.dart';
import 'onboardingslidebutton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX Controller Initialize
    final OnboardingController controller = Get.find<OnboardingController>();

    // AppBackground khud Scaffold + background image + SafeArea deta hai,
    // isliye alag Scaffold lagane ki zaroorat nahi.
    return AppBackground(
      child: Column(
        children: [
          /// ---------------- HEADER LOGO (TOP FIXED) ----------------
          Padding(
            padding: EdgeInsets.only(
              left: AppSize.widthPercent(0.06),
              top: AppSize.heightPercent(0.02),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/logo.png',
                height: AppSize.heightPercent(0.035),
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// ---------------- SWIPEABLE PAGES ----------------
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingData.length,
              itemBuilder: (context, index) {
                final item = controller.onboardingData[index];

                return Stack(
                  // clipBehavior: Clip.none rakha hai taake agar kisi image
                  // ka natural height available space se zyada ho, to wo
                  // upar ki taraf "peek" kar sake (bilkul design jaisa,
                  // jahan hath/sar button ke qareeb tak pohanchte hain)
                  // bina kisi cropping ke.
                  clipBehavior: Clip.none,
                  children: [
                    /// ---------------- BACKGROUND LAYER: CHARACTER IMAGE ----------------
                    /// Yahan koi FIXED height nahi di gayi. Sirf width poori
                    /// screen ke barabar di hai aur BoxFit.fitWidth diya hai,
                    /// isliye Flutter image ki ASLI aspect ratio ke hisab se
                    /// khud height nikaal lega -> NA cropping hogi, NA
                    /// distortion. Chhoti image (jaise 3rd wali meditation
                    /// wali) khud kam jagah legi, badi image (jaise hath
                    /// upar wali) khud zyada upar tak jayegi.
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: IgnorePointer(
                        child: Image.asset(
                          item["image"]!,
                          width: AppSize.width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),

                    /// ---------------- FOREGROUND LAYER: TITLE + SUBTITLE + BUTTON ----------------
                    /// Ye layer Stack mein image ke BAAD likha gaya hai,
                    /// isliye ye hamesha image ke UPAR (z-index mein aage)
                    /// render hoga. Matlab image ka koi bhi hissa (hath/sar)
                    /// button ko kabhi cover nahi karega - button hamesha
                    /// crisp aur poora visible rahega, image uske ird gird
                    /// ya thoda peeche dikhegi.
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.widthPercent(0.06),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: AppSize.heightPercent(0.035)),

                            /// TITLE
                            Text(
                              item["title"]!,
                              style: TextStyle(
                                fontSize: AppSize.widthPercent(0.07),
                                color: AppColors.textcolor1,
                                fontFamily: "pr",
                                height: 1.05,
                              ),
                            ),

                            SizedBox(height: AppSize.heightPercent(0.015)),

                            /// SUBTITLE
                            Text(
                              item["subTitle"]!,
                              style: TextStyle(
                                fontSize: AppSize.widthPercent(0.037),
                                fontFamily: "pr",
                                color: AppColors.textcolor2,
                                height: 1.05,
                              ),
                            ),

                            SizedBox(height: AppSize.heightPercent(0.034)),

                            /// DRAG-TO-CONTINUE BUTTON (design ke gradient
                            /// circle-arrow button jaisa, slide se trigger
                            /// hota hai)
                            OnboardSlideButton(
                                label: "Next > > >",
                                onCompleted: controller.nextPage,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}