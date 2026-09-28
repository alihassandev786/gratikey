import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Rounded linear progress bar + optional trailing "xx%" label.
/// "3 of 12 Keys Collected" (Keys list), "Initiation Pathway" (Digital Ring)
/// aur "Overall Journey" (Progress) — teeno isi ek widget se banti hain.
class KeyProgressBar extends StatelessWidget {
  final double value; // 0.0 - 1.0
  final String? trailingLabel;
  final double? height;
  final Color? trackColor;
  final Color? progressColor;

  const KeyProgressBar({
    super.key,
    required this.value,
    this.trailingLabel,
    this.height,
    this.trackColor,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final double barHeight = height ?? AppSize.heightPercent(0.013);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (trailingLabel != null) ...[
          Text(
            trailingLabel!,
            style: TextStyle(
              fontFamily: "pm",
              fontWeight: FontWeight.w600,
              fontSize: AppSize.widthPercent(0.033),
              color: AppColors.textcolor1,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.008)),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: double.infinity,
            height: barHeight,
            color: trackColor ?? AppColors.secondary1.withOpacity(0.22),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: progressColor ?? AppColors.secondary1,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}