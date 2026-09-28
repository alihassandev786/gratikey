import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/softcard.dart';

/// "Free Member Sanctuary" upsell card — entries progress bar + "Unlock Unlimited" link.
class MemberStatusCard extends StatelessWidget {
  final bool isPremium;
  final int used;
  final int limit;
  final VoidCallback onUnlockTap;

  const MemberStatusCard({
    super.key,
    required this.isPremium,
    required this.used,
    required this.limit,
    required this.onUnlockTap,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = isPremium ? 1 : (used / limit).clamp(0, 1).toDouble();

    return SoftCard(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: AppSize.height*0.01,vertical: AppSize.height*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("\u231B", style: TextStyle(fontSize: AppSize.widthPercent(0.05))),
                SizedBox(width: AppSize.widthPercent(0.025)),
                Expanded(
                  child: Text(
                    isPremium ? "Premium Sanctuary" : "Free Member Sanctuary",
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.04),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.widthPercent(0.01)),
            Text(
              isPremium ? "Unlimited entries unlocked" : "$used of $limit entries preserved",
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.033),
                color: AppColors.textcolor2,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.03)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: AppSize.widthPercent(0.018),
                backgroundColor: AppColors.secondary1.withOpacity(0.25),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary1),
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.035)),
            Text(
              "Free includes up to $limit saved reflections. Premium unlocks unlimited journal entries, full reflection history, and audio voice archives.",
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.03),
                height: 1.4,
                color: AppColors.textcolor2,
              ),
            ),
            if (!isPremium) ...[
              SizedBox(height: AppSize.widthPercent(0.03)),
              GestureDetector(
                onTap: onUnlockTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Unlock Unlimited",
                      style: TextStyle(
                        fontFamily: "pm",
                        fontSize: AppSize.widthPercent(0.033),
                        color: AppColors.secondary1,
                      ),
                    ),
                    SizedBox(width: AppSize.widthPercent(0.015)),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: AppSize.widthPercent(0.042),
                      color: AppColors.secondary1,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}