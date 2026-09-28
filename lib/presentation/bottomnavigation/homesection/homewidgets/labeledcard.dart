import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import 'goldiconcircle.dart';
import 'softcard.dart';

/// Card jis ke upar gold icon + gold label ho aur neeche text.
/// Misal: Today's Teaching / Reflect / Take Action / Morning Key Prompt / Grounded Insight.
class LabeledCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String text;
  final String? trailing;
  final Color? color;
  final double? textSize;
  final bool shadow;

  const LabeledCard({
    super.key,
    required this.icon,
    required this.label,
    required this.text,
    this.trailing,
    this.color,
    this.textSize,
    this.shadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      color: color,
      shadow: shadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GoldIconCircle(icon: icon, size: AppSize.widthPercent(0.105)),
              SizedBox(width: AppSize.widthPercent(0.028)),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.037),
                    color: AppColors.secondary1,
                  ),
                ),
              ),
              if (trailing != null)
                Text(
                  trailing!,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    color: AppColors.textcolor2,
                  ),
                ),
            ],
          ),
          SizedBox(height: AppSize.widthPercent(0.035)),
          Text(
            text,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: textSize ?? AppSize.widthPercent(0.038),
              height: 1.45,
              color: AppColors.textcolor1,
            ),
          ),
        ],
      ),
    );
  }
}
