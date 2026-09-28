import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// "Phase 1 / Inhale / 4s" wala chota card. [active] par halka border aata hai.
class PhaseCard extends StatelessWidget {
  final int index;
  final String name;
  final int seconds;
  final bool active;

  const PhaseCard({
    super.key,
    required this.index,
    required this.name,
    required this.seconds,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSize.widthPercent(0.045)),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(active ? 0.6 : 0.4),
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
        border: active
            ? Border.all(color: AppColors.secondary1.withOpacity(0.6), width: 1.2)
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Phase $index",
            style: TextStyle(
              fontFamily: "pm",
              fontSize: AppSize.widthPercent(0.04),
              color: AppColors.textcolor1,
            ),
          ),
          SizedBox(height: AppSize.widthPercent(0.02)),
          Text(
            name,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.035),
              color: AppColors.textcolor2.withOpacity(0.8),
            ),
          ),
          Text(
            "${seconds}s",
            style: TextStyle(
              fontFamily: "pm",
              fontSize: AppSize.widthPercent(0.035),
              color: AppColors.secondary1,
            ),
          ),
        ],
      ),
    );
  }
}
