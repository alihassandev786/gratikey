import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Chota gold pill / chip (optional icon ke saath).
/// Misal: "Today's 3-Minute Practice", "Serene", "Take 3 deep breaths".
class GoldPill extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const GoldPill({
    super.key,
    required this.text,
    this.icon,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double fs = fontSize ?? AppSize.widthPercent(0.028);
    final Color tc = textColor ?? AppColors.secondary1;

    final Widget pill = Container(
      padding: EdgeInsets.symmetric(horizontal: fs * 1.1, vertical: fs * 0.55),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.secondary1.withOpacity(0.22),
        borderRadius: BorderRadius.circular(fs * 3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: tc, size: fs * 1.25),
            SizedBox(width: fs * 0.45),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontFamily: "pm", fontSize: fs, color: tc),
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return pill;
    return GestureDetector(onTap: onTap, child: pill);
  }
}
