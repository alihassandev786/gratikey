import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Audio ki progress bar. [onSeek] diya to tap/drag karke aage-peeche kar sakte hain.
/// [progress] 0.0 - 1.0.
class AudioProgressBar extends StatelessWidget {
  final double progress;
  final ValueChanged<double>? onSeek;
  final double? height;
  final Color? fillColor;
  final Color? trackColor;

  const AudioProgressBar({
    super.key,
    required this.progress,
    this.onSeek,
    this.height,
    this.fillColor,
    this.trackColor,
  });

  @override
  Widget build(BuildContext context) {
    final double h = height ?? AppSize.widthPercent(0.015);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double w = constraints.maxWidth;

        double fraction(double dx) => w <= 0 ? 0.0 : (dx / w).clamp(0.0, 1.0);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: onSeek == null
              ? null
              : (details) => onSeek!(fraction(details.localPosition.dx)),
          onHorizontalDragUpdate: onSeek == null
              ? null
              : (details) => onSeek!(fraction(details.localPosition.dx)),
          child: SizedBox(
            height: h * 3,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(h),
                child: SizedBox(
                  height: h,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        color: trackColor ??
                            AppColors.secondary1.withOpacity(0.28),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: progress.clamp(0.0, 1.0),
                        child: Container(
                          color: fillColor ?? AppColors.secondary1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
