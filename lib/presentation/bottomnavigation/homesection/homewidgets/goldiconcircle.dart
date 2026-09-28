import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Gold rang ka gol badge — andar icon ya number (text) dikhata hai.
/// Ab gradient bhi support karta hai.
class GoldIconCircle extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  final Gradient? gradient; // ← naya parameter

  const GoldIconCircle({
    super.key,
    this.icon,
    this.text,
    this.size,
    this.backgroundColor,
    this.iconColor,
    this.gradient,
  }) : assert(icon != null || text != null);

  @override
  Widget build(BuildContext context) {
    final double s = size ?? AppSize.widthPercent(0.11);
    final Color c = iconColor ?? AppColors.secondary1;

    return Container(
      width: s,
      height: s,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Agar gradient diya ho to gradient, warna solid color
        gradient: gradient,
        color: gradient == null
            ? (backgroundColor ?? AppColors.secondary1.withOpacity(0.35))
            : null,
      ),
      child: text != null
          ? Text(
        text!,
        style: TextStyle(
          fontFamily: "pm",
          fontSize: s * 0.42,
          color: c,
        ),
      )
          : Icon(icon, color: c, size: s * 0.5),
    );
  }
}