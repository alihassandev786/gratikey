import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Poore Keys section (Keys list, Key Detail, Locked Premium, Digital Ring,
/// Progress) mein same cream/tan rounded card style baar baar use hoti hai —
/// isliye ise ek hi common widget mein rakh diya taake sab jagah consistent
/// rahe aur baad mein color/radius change karna ho to sirf yahan karna parega.
class SectionCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? radius;
  final Border? border;

  const SectionCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.radius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding ?? EdgeInsets.all(AppSize.widthPercent(0.045)),
      decoration: BoxDecoration(
        color: color ?? AppColors.secondary3.withOpacity(0.6),
        borderRadius: BorderRadius.circular(radius ?? AppSize.widthPercent(0.06)),
        border: border,
      ),
      child: child,
    );
  }
}