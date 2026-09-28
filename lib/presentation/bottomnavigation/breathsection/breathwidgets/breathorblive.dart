import 'package:flutter/material.dart';

import 'breathorb.dart';

/// Active Breathing screen ka circle.
/// Controller se phase/scale/progress aata hai; circle [targetScale] tak
/// [phaseDuration] mein smooth animate hota hai, aur [paused] hone par ruk jata hai.
class BreathOrbLive extends StatefulWidget {
  final double targetScale;
  final Duration phaseDuration;
  final bool paused;
  final Object phaseId;
  final String label;
  final double progress;
  final Duration progressDuration;
  final String secondsText;
  final double? size;

  const BreathOrbLive({
    super.key,
    required this.targetScale,
    required this.phaseDuration,
    required this.paused,
    required this.phaseId,
    required this.label,
    required this.progress,
    required this.progressDuration,
    required this.secondsText,
    this.size,
  });

  @override
  State<BreathOrbLive> createState() => _BreathOrbLiveState();
}

class _BreathOrbLiveState extends State<BreathOrbLive>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scale;

  @override
  void initState() {
    super.initState();
    _scale = AnimationController(
      vsync: this,
      lowerBound: kBreathOrbMinScale,
      upperBound: 1.0,
      value: kBreathOrbMinScale,
    );
    _animate(fullPhase: true);
  }

  @override
  void didUpdateWidget(covariant BreathOrbLive oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.phaseId != oldWidget.phaseId) {
      // Nayi phase shuru
      _animate(fullPhase: true);
    } else if (widget.paused != oldWidget.paused) {
      if (widget.paused) {
        _scale.stop();
      } else {
        // Resume: bacha hua hissa hi animate karo
        _animate(fullPhase: false);
      }
    }
  }

  void _animate({required bool fullPhase}) {
    if (widget.paused) return;

    Duration d = widget.phaseDuration;
    if (!fullPhase) {
      final double range = 1.0 - kBreathOrbMinScale;
      d = d * ((widget.targetScale - _scale.value).abs() / range);
    }

    _scale.animateTo(widget.targetScale, duration: d, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _scale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (context, _) {
        return BreathOrbView(
          size: widget.size,
          scale: _scale.value,
          label: widget.label,
          progress: widget.progress,
          phaseId: widget.phaseId,
          progressDuration: widget.progressDuration,
          secondsText: widget.secondsText,
        );
      },
    );
  }
}
