import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Radio-style selection circle: selected = gradient + check, unselected = sirf border.
class GradientCheckCircle extends StatelessWidget {
  final bool selected;
  final double? size;

  const GradientCheckCircle({super.key, required this.selected, this.size});

  @override
  Widget build(BuildContext context) {
    final double s = size ?? AppSize.widthPercent(0.06);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: s,
      height: s,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: selected
            ? const LinearGradient(
                colors: [AppColors.primary1, AppColors.primary2],
              )
            : null,
        border: selected
            ? null
            : Border.all(
                color: AppColors.primary2.withOpacity(0.7),
                width: 1.4,
              ),
      ),
      child: selected
          ? Icon(Icons.check, color: Colors.white, size: s * 0.65)
          : null,
    );
  }
}
