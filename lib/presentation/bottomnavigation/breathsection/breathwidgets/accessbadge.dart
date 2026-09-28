import 'package:flutter/material.dart';

import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/goldpill.dart';

/// "Free" (hara) ya "Premium" (gold + lock) chota badge.
class AccessBadge extends StatelessWidget {
  final bool premium;
  final double? fontSize;

  const AccessBadge({super.key, required this.premium, this.fontSize});

  @override
  Widget build(BuildContext context) {
    final double fs = fontSize ?? AppSize.widthPercent(0.03);

    if (premium) {
      return GoldPill(
        icon: Icons.lock_rounded,
        text: "Premium",
        fontSize: fs,
      );
    }

    return GoldPill(
      text: "Free",
      fontSize: fs,
      backgroundColor: const Color(0xffA8CDA4),
      textColor: const Color(0xff1E8E4E),
    );
  }
}
