import 'package:flutter/material.dart';

import 'breathorb.dart';

/// Breath tab ka apne aap chalne wala (Inhale / Exhale) circle.
/// Tab dikhai na de (ya doosri screen upar ho) to animation khud ruk jata hai.
class BreathOrbPreview extends StatefulWidget {
  final double? size;

  const BreathOrbPreview({super.key, this.size});

  @override
  State<BreathOrbPreview> createState() => _BreathOrbPreviewState();
}

class _BreathOrbPreviewState extends State<BreathOrbPreview>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final double t = Curves.easeInOut.transform(_animation.value);

        return BreathOrbView(
          size: widget.size,
          scale: kBreathOrbMinScale + (1.0 - kBreathOrbMinScale) * t,
          label: _animation.status == AnimationStatus.reverse
              ? "Exhale"
              : "Inhale",
        );
      },
    );
  }
}
