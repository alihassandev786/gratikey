import 'package:flutter/material.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';

/// Drag / Slide-to-continue button.
/// Design ke gradient circle-arrow button jaisa dikhta hai, lekin
/// user isay drag kerke complete kerta hai (jaisa reference OnboardSlide widget mein tha).
class OnboardSlideButton extends StatefulWidget {
  final String label;
  final VoidCallback onCompleted;
  final double? width;
  final double? height;

  const OnboardSlideButton({
    super.key,
    required this.label,
    required this.onCompleted,
    this.width,
    this.height,
  });

  @override
  State<OnboardSlideButton> createState() => _OnboardSlideButtonState();
}

class _OnboardSlideButtonState extends State<OnboardSlideButton> {
  double _dragX = 0.0;
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    final double trackW = widget.width ?? AppSize.widthPercent(0.41);
    final double trackH = widget.height ?? AppSize.heightPercent(0.06);
    const double pad = 4.0;
    final double knob = trackH - (pad * 2);
    final double maxDrag = trackW - knob - (pad * 2);

    // Agar page change ho aur maxDrag negative/tiny na ho isliye clamp safe rakha
    final double safeDragX = _dragX.clamp(0.0, maxDrag <= 0 ? 0.0 : maxDrag);

    // Drag progress (0.0 -> 1.0) — label isi ke hisab se fade out hoga
    final double dragProgress =
    maxDrag > 0 ? (safeDragX / maxDrag).clamp(0.0, 1.0) : 0.0;

    return Container(
      width: trackW,
      height: trackH,
      padding: const EdgeInsets.all(pad),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(trackH),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.primary1, AppColors.primary2],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// LABEL TEXT — knob aagay jate hi gradually fade/gaib hota hai
          Padding(
            padding: EdgeInsets.only(left: knob * 0.55),
            child: AnimatedOpacity(
              duration: _dragging
                  ? Duration.zero
                  : const Duration(milliseconds: 220),
              opacity: 1 - dragProgress,
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.widthPercent(0.04),
                ),
              ),
            ),
          ),

          /// DRAGGABLE WHITE CIRCLE KNOB
          AnimatedPositioned(
            duration:
            _dragging ? Duration.zero : const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            left: safeDragX,
            child: GestureDetector(
              onHorizontalDragStart: (_) => setState(() => _dragging = true),
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragX = (_dragX + details.delta.dx)
                      .clamp(0.0, maxDrag <= 0 ? 0.0 : maxDrag);
                });
              },
              onHorizontalDragEnd: (_) {
                setState(() => _dragging = false);

                if (maxDrag > 0 && _dragX >= maxDrag * 0.6) {
                  // Threshold cross -> complete
                  setState(() => _dragX = maxDrag);
                  widget.onCompleted();

                  // Reset knob thori dair baad taake agla page bhi fresh dikhe
                  Future.delayed(const Duration(milliseconds: 350), () {
                    if (mounted) setState(() => _dragX = 0);
                  });
                } else {
                  // Wapis start par snap
                  setState(() => _dragX = 0);
                }
              },
              child: Container(
                width: knob,
                height: knob,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.textcolor1,
                  size: knob * 0.45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}