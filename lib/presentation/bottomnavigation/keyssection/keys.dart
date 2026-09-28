import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/appheader.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/keyscontroller.dart';
import 'keyswidgets/keyiconbadge.dart';
import 'keyswidgets/sectioncard.dart';
import 'keyswidgets/statuslable.dart';

/// Bottom nav ka "Keys" tab — "My 12 Keys Journey".
class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  final KeysController controller = Get.find<KeysController>();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.widthPercent(0.053),
          vertical: AppSize.heightPercent(0.015),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appheader(
              title: controller.journeyTitle,
              subtitle: controller.journeySubtitle,
            ),

            SizedBox(height: AppSize.heightPercent(0.022)),

            /// FREE TIER BANNER
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.freeTierBadge,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSize.widthPercent(0.03),
                      color: AppColors.secondary1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),
                  Text(
                    controller.freeTierDescription,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.03),
                      color: AppColors.textcolor2,
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),
                  CustomButton(
                    title: controller.unlockBannerButton,
                    onTap: controller.goToLockedPremium,
                    leftPadding: EdgeInsets.symmetric(
                      horizontal: AppSize.height * 0.018,
                    ),
                    leftWidget: const Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.heightPercent(0.03)),

            /// 12 KEYS TIMELINE LIST
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.keysList.length,
              itemBuilder: (context, index) {
                final KeyItemData key = controller.keysList[index];
                final bool isLast = index == controller.keysList.length - 1;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TIMELINE (dot + connecting line)
                      Column(
                        children: [
                          KeyIconBadge(
                            size: AppSize.widthPercent(0.105),
                            background: key.status == KeyStatus.upcoming
                                ? AppColors.secondary1.withOpacity(0.12)
                                : AppColors.secondary1.withOpacity(0.28),
                          ),
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 2,
                                margin: EdgeInsets.symmetric(
                                  vertical: AppSize.heightPercent(0.006),
                                ),
                                color: AppColors.secondary1.withOpacity(0.35),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(width: AppSize.widthPercent(0.03)),

                      /// KEY CARD
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppSize.heightPercent(0.02),
                          ),
                          child: GestureDetector(
                            onTap: () => controller.openKeyFromList(key, index),
                            child: Opacity(
                              opacity: key.status == KeyStatus.upcoming
                                  ? 0.78
                                  : 1,
                              child: SectionCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Key ${key.number.toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                            fontFamily: "pm",
                                            fontWeight: FontWeight.w700,
                                            fontSize: AppSize.widthPercent(
                                              0.03,
                                            ),
                                            color: AppColors.secondary1,
                                          ),
                                        ),
                                        StatusLabel(status: key.status),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppSize.heightPercent(0.008),
                                    ),
                                    Text(
                                      key.title,
                                      style: TextStyle(
                                        fontFamily: "pm",
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSize.widthPercent(0.038),
                                        color: AppColors.textcolor1,
                                        height: 1.25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSize.heightPercent(0.02),
                                    ),
                                    Text(
                                      "TODAY'S CALL TO ACTION",
                                      style: TextStyle(
                                        fontFamily: "pm",
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSize.widthPercent(0.027),
                                        color: AppColors.secondary1,
                                        letterSpacing: 0.4,
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSize.heightPercent(0.006),
                                    ),
                                    Text(
                                      key.callToAction,
                                      style: TextStyle(
                                        fontFamily: "pr",
                                        fontSize: AppSize.widthPercent(0.027),
                                        color: AppColors.textcolor2,
                                        height: 1.35,
                                      ),
                                    ),

                                    /// STATUS-BASED FOOTER
                                    if (key.status == KeyStatus.completed) ...[
                                      SizedBox(
                                        height: AppSize.heightPercent(0.016),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.lock_open_rounded,
                                                size: AppSize.widthPercent(
                                                  0.033,
                                                ),
                                                color: AppColors.textcolor2,
                                              ),
                                              SizedBox(
                                                width: AppSize.widthPercent(
                                                  0.012,
                                                ),
                                              ),
                                              Text(
                                                "Unlocked",
                                                style: TextStyle(
                                                  fontFamily: "pr",
                                                  fontSize:
                                                      AppSize.widthPercent(
                                                        0.031,
                                                      ),
                                                  color: AppColors.textcolor2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    AppColors.primary1,
                                                    AppColors.primary2,
                                                  ],
                                                ).createShader(bounds),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Review Key",
                                                  style: TextStyle(
                                                    fontFamily: "pm",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        AppSize.widthPercent(
                                                          0.032,
                                                        ),
                                                    color: Colors.white, // gradient isi par lagta hai
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right_rounded,
                                                  size: AppSize.widthPercent(
                                                    0.04,
                                                  ),
                                                  color: Colors.white, // gradient isi par lagta hai
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ] else if (key.status ==
                                        KeyStatus.inProgress) ...[
                                      SizedBox(
                                        height: AppSize.heightPercent(0.018),
                                      ),
                                      CustomButton(
                                        title: "Continue Key ${key.number}",
                                        height: AppSize.heightPercent(0.055),
                                        onTap: () =>
                                            controller.goToKeyDetail(index),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: AppSize.heightPercent(0.02)),
          ],
        ),
      ),
    );
  }
}
