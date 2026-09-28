import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/goldiconcircle.dart';
import '../../homesection/homewidgets/softcard.dart';

/// Active Breathing ka gold "Somatic Grounding Tip" card.
class SomaticTipCard extends StatelessWidget {
  final String title;
  final String text;

  const SomaticTipCard({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      color: AppColors.secondary1,
      radius: AppSize.widthPercent(0.085),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.045),
        vertical: AppSize.widthPercent(0.06),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GoldIconCircle(
            icon: Icons.auto_awesome_rounded,
            size: AppSize.widthPercent(0.115),
            backgroundColor: Colors.white.withOpacity(0.3),
            iconColor: Colors.white,
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.04),
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.widthPercent(0.012)),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Text(
                    text,
                    key: ValueKey(text),
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.03),
                      height: 1.35,
                      color: Colors.white.withOpacity(0.95),
                    ),
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
