import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Box-breathing ka concentric circle. [scale] badalne par andar wala circle animate hota hai.
/// [activeDot]: 0 = top, 1 = right, 2 = bottom, 3 = left.
class BreathCircle extends StatelessWidget {
  final String label;
  final String secondsText;
  final double scale;
  final int activeDot;

  const BreathCircle({
    super.key,
    required this.label,
    required this.secondsText,
    required this.scale,
    required this.activeDot,
  });

  @override
  Widget build(BuildContext context) {
    final double size = AppSize.widthPercent(0.6);
    final double baseInner = size * 0.55;
    final double inner = baseInner * scale;
    final double dot = size * 0.045;
    final double orbit = size * 0.41;
    final double c = size / 2;

    Widget dotAt(double dx, double dy, bool active) {
      return Positioned(
        left: c + dx * orbit - dot / 2,
        top: c + dy * orbit - dot / 2,
        child: Container(
          width: dot,
          height: dot,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? AppColors.secondary1 : const Color(0xffB9C6D2),
          ),
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// OUTER RING
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary1.withOpacity(0.16),
            ),
          ),

          /// MIDDLE RING
          Container(
            width: size * 0.715,
            height: size * 0.715,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary1.withOpacity(0.2),
            ),
          ),

          /// INNER (animated) CIRCLE
          AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOut,
            width: inner,
            height: inner,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary1,
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary1.withOpacity(0.4),
                  blurRadius: size * 0.06,
                  offset: Offset(0, size * 0.02),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(inner * 0.08),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.air_rounded, color: Colors.white, size: baseInner * 0.2),
                    SizedBox(height: baseInner * 0.03),
                    Text(
                      label,
                      style: TextStyle(
                        fontFamily: "pm",
                        fontSize: baseInner * 0.14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      secondsText,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: baseInner * 0.1,
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ORBIT DOTS
          dotAt(0, -1, activeDot == 0),
          dotAt(1, 0, activeDot == 1),
          dotAt(0, 1, activeDot == 2),
          dotAt(-1, 0, activeDot == 3),
        ],
      ),
    );
  }
}
