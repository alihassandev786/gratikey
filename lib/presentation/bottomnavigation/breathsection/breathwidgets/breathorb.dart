import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import 'breathphasebar.dart';

/// Orb ka sabse chota scale (exhale ke waqt).
const double kBreathOrbMinScale = 0.8;

/// Breathing circle (bahar halka ring + andar gold circle).
/// Sirf UI hai — [scale] bahar se aata hai (animation dene wale widgets:
/// BreathOrbPreview aur BreathOrbLive).
///
/// - [progress] diya to andar patli bar dikhti hai
/// - [secondsText] diya to bar ke neeche "4s" dikhta hai
class BreathOrbView extends StatelessWidget {
  final double scale;
  final String label;
  final IconData icon;
  final double? size;
  final double? progress;
  final Object? phaseId;
  final Duration progressDuration;
  final String? secondsText;

  const BreathOrbView({
    super.key,
    required this.scale,
    required this.label,
    this.icon = Icons.air_rounded,
    this.size,
    this.progress,
    this.phaseId,
    this.progressDuration = const Duration(seconds: 1),
    this.secondsText,
  });

  @override
  Widget build(BuildContext context) {
    final double s = size ?? AppSize.widthPercent(0.5);
    final double base = s * 0.765;
    final double inner = base * scale;

    return SizedBox(
      width: s,
      height: s,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// OUTER RING
          Container(
            width: s,
            height: s,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary1.withOpacity(0.18),
            ),
          ),

          /// INNER GOLD CIRCLE (scale ke saath bara/chota)
          Container(
            width: inner,
            height: inner,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary1,
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary1.withOpacity(0.35),
                  blurRadius: s * 0.08,
                  offset: Offset(0, s * 0.02),
                ),
              ],
            ),
          ),

          /// CONTENT (circle ke saath resize nahi hota)
          SizedBox(
            width: base * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: base * 0.2),
                SizedBox(height: base * 0.04),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: FittedBox(
                    key: ValueKey(label),
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: "pm",
                        fontSize: base * 0.085,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                if (progress != null) ...[
                  SizedBox(height: base * 0.06),
                  BreathPhaseBar(
                    progress: progress!,
                    phaseId: phaseId,
                    duration: progressDuration,
                    width: base * 0.66,
                    height: base * 0.03,
                  ),
                ],
                if (secondsText != null && secondsText!.isNotEmpty) ...[
                  SizedBox(height: base * 0.05),
                  Text(
                    secondsText!,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: base * 0.08,
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
