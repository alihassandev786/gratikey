import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

/// Screen khulte hi upar se confetti girata hai. Stack ke upar rakh dein.
class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({super.key});

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay> {
  late final ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 4));
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 40,
          gravity: 0.15,
          emissionFrequency: 0.05,
          maxBlastForce: 25,
          minBlastForce: 8,
          colors: const [
            Color(0xFF8FC9D8),
            Color(0xFFF28C7A),
            Color(0xFFDDA53E),
            Colors.pinkAccent,
            Colors.greenAccent,
            Colors.blueAccent,
            Colors.orangeAccent,
            Colors.purpleAccent,
          ],
        ),
      ),
    );
  }
}
