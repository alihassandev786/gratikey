import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/appheader.dart';
import 'package:gratikey/core/widgets/background.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/goldiconcircle.dart';

import '../../../data/controllers/subcryptioncontroller.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final SubscriptionController controller = Get.find<SubscriptionController>();

    return AppBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthPercent(0.05),
              vertical: AppSize.heightPercent(0.01),
            ),
            child: Appheader(
              title: "Subscription",
              showBackButton: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(

              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.055),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// KEY ICON
                  Container(
                    padding: EdgeInsets.all(AppSize.height*0.005),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Container(
                      width: AppSize.widthPercent(0.16),
                      height: AppSize.widthPercent(0.16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondary1.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.vpn_key_rounded,
                        color: AppColors.secondary1,
                        size: AppSize.widthPercent(0.08),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.03)),
                  Text(
                    "Select Subscription Plan!",
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.045),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.017)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.height*0.025),
                    child: Text(
                      "Awaken your full 12 Keys journey with a 7 day free trial.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.034),
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.065)),

                  /// SECTIONS
                  ...controller.sections.map((s) {
                    return Padding(
                      padding:
                      EdgeInsets.only(bottom: AppSize.widthPercent(0.035)),
                      child: SoftCard(
                        radius: AppSize.widthPercent(0.055),
                        padding: EdgeInsets.all(AppSize.widthPercent(0.06)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GoldIconCircle(
                                  size: AppSize.height*0.042,
                                  text: s["number"] as String,
                                  gradient: LinearGradient(
                                    colors: [Color(0xffDDA53E), Color(0xff775921)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  iconColor: Colors.white,
                                ),
                                SizedBox(width: AppSize.widthPercent(0.03)),
                                Expanded(
                                  child: Text(
                                    s["title"] as String,
                                    style: TextStyle(
                                      fontFamily: "pm",
                                      fontSize: AppSize.widthPercent(0.04),
                                      color: AppColors.textcolor1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.widthPercent(0.025)),
                            ...(s["points"] as List<String>).map((point) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: AppSize.widthPercent(0.012)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "•  ",
                                      style: TextStyle(
                                        fontFamily: "pr",
                                        fontSize: AppSize.widthPercent(0.032),
                                        color: AppColors.textcolor1,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        point,
                                        style: TextStyle(
                                          fontFamily: "pr",
                                          fontSize:
                                          AppSize.widthPercent(0.025),
                                          height: 1.35,
                                          color: AppColors.textcolor1
                                              .withOpacity(0.85),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: AppSize.heightPercent(0.03)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
