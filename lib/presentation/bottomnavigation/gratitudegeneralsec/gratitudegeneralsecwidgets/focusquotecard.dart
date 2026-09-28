import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/backbutton.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/goldiconcircle.dart';
import '../../homesection/homewidgets/softcard.dart';

/// "Today's Focus" card: leaf/spa icon + title + quote + refresh button.
/// Create aur Edit Journal Entry screens dono mein reuse hoti hai.
class FocusQuoteCard extends StatelessWidget {
  final String title;
  final String quote;
  final VoidCallback onRefresh;

  const FocusQuoteCard({
    super.key,
    required this.title,
    required this.quote,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      color: Colors.white.withOpacity(0.55),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: AppSize.height*0.005),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoldIconCircle(
              icon: Icons.spa_rounded,
              size: AppSize.widthPercent(0.12),
            ),
            SizedBox(width: AppSize.widthPercent(0.035)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.04),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.02)),
                  Text(
                    "\u201C$quote\u201D",
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.028),
                      height: 1.35,
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSize.widthPercent(0.02)),
            Custombackbutton(
              icon: Icons.autorenew_rounded,
              size: AppSize.widthPercent(0.1),
              onTap: onRefresh,
            ),
          ],
        ),
      ),
    );
  }
}