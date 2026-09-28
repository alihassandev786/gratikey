import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// App ka standard cream (secondary3) rounded card.
/// Home, prompt, reflection, breath, encouragement — sab jagah yahi use hota hai.
class SoftCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? radius;
  final bool shadow;
  final VoidCallback? onTap;

  const SoftCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.radius,
    this.shadow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Widget card = Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(AppSize.widthPercent(0.05)),
      decoration: BoxDecoration(
        color: color ?? AppColors.secondary3,
        borderRadius:
        BorderRadius.circular(radius ?? AppSize.widthPercent(0.07)),
        boxShadow: shadow
            ? [
          BoxShadow(
            color: AppColors.secondary1.withOpacity(0.14),
            blurRadius: AppSize.widthPercent(0.04),
            offset: Offset(0, AppSize.widthPercent(0.012)),
          ),
        ]
            : null,
      ),
      child: child,
    );

    if (onTap == null) return card;
    return GestureDetector(onTap: onTap, child: card);
  }
}
