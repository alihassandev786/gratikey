import 'package:flutter/material.dart';

/// Breathing circle ke andar wali patli progress bar (white track + dark fill).
/// [phaseId] badalte hi bar 0 se dobara shuru hoti hai.
class BreathPhaseBar extends StatelessWidget {
  final double progress;
  final Object? phaseId;
  final Duration duration;
  final double width;
  final double height;

  const BreathPhaseBar({
    super.key,
    required this.progress,
    required this.width,
    required this.height,
    this.phaseId,
    this.duration = const Duration(seconds: 1),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Colors.white),
            TweenAnimationBuilder<double>(
              key: ValueKey(phaseId),
              tween: Tween<double>(begin: 0.0, end: progress.clamp(0.0, 1.0)),
              duration: duration,
              curve: Curves.linear,
              builder: (context, value, _) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff3A3A3A),
                        borderRadius: BorderRadius.circular(height),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
