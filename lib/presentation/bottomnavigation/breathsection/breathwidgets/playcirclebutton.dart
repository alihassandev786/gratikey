import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Gold gol Play / Pause button (loading par chota spinner dikhata hai).
class PlayCircleButton extends StatelessWidget {
  final bool playing;
  final bool loading;
  final double? size;
  final VoidCallback? onTap;
  final Color? color;

  const PlayCircleButton({
    super.key,
    this.playing = false,
    this.loading = false,
    this.size,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double s = size ?? AppSize.widthPercent(0.11);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: s,
        height: s,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? AppColors.secondary1,
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  width: s * 0.38,
                  height: s * 0.38,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Icon(
                  playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: s * 0.55,
                ),
        ),
      ),
    );
  }
}
