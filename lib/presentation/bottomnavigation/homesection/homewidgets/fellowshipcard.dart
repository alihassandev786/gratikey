import 'package:flutter/material.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/homecontroller.dart';

/// Home ke neeche "Sanctuary Fellowship Wisdom" card.
class FellowshipCard extends StatelessWidget {
  final HomeController controller;

  const FellowshipCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double avatar = AppSize.widthPercent(0.17);

    return SoftCard(
      color: Colors.white.withOpacity(0.2),
      shadow: false,
      radius: AppSize.widthPercent(0.065),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              controller.fellowshipImage,
              width: avatar,
              height: avatar,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: avatar,
                height: avatar,
                color: AppColors.secondary1.withOpacity(0.3),
                child: Icon(
                  Icons.person_rounded,
                  color: AppColors.secondary1,
                  size: avatar * 0.5,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.04)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.fellowshipLabel,
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.027),
                    letterSpacing: 0.4,
                    color: AppColors.secondary1,
                  ),
                ),
                SizedBox(height: AppSize.widthPercent(0.015)),
                Text(
                  controller.fellowshipQuote,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.036),
                    height: 1.3,
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.widthPercent(0.015)),
                Text(
                  controller.fellowshipAuthor,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    color: AppColors.textcolor2.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
