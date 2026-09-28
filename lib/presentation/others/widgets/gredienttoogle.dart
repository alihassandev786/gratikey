import 'package:flutter/material.dart';

import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';

/// Chota gradient switch/toggle — reminder cards ke ON/OFF liye.
/// ON hone par app ka standard primary1 -> primary2 gradient track dikhata hai,
/// OFF hone par plain grey track.
class GradientToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const GradientToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double trackW = AppSize.widthPercent(0.13);
    final double trackH = AppSize.heightPercent(0.032);
    final double knob = trackH - 6;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: trackW,
        height: trackH,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(trackH),
          gradient: value
              ? const LinearGradient(
            colors: [AppColors.primary1, AppColors.primary2],
          )
              : null,
          color: value ? null : const Color(0xFFD9D9D9),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: knob,
            height: knob,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}