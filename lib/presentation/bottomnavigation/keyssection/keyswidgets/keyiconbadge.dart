import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Circular golden key-icon badge. Keys list ki timeline dots, Key Detail
/// ka header icon, Locked Premium ka outline icon, aur Progress screen ke
/// chote key badges — sab isi ek widget se bante hain.
class KeyIconBadge extends StatelessWidget {
  final double? size;
  final Color? background;
  final Color? iconColor;
  final IconData icon;
  final bool outlined;

  const KeyIconBadge({
    super.key,
    this.size,
    this.background,
    this.iconColor,
    this.icon = Icons.vpn_key_rounded,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final double s = size ?? AppSize.widthPercent(0.11);
    return Container(
      height: s,
      width: s,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: background ?? AppColors.secondary1.withOpacity(0.18),
        border: outlined
            ? Border.all(color: AppColors.secondary1.withOpacity(0.5), width: 1.4)
            : null,
      ),
      child: Icon(
        icon,
        color: iconColor ?? AppColors.secondary1,
        size: s * 0.5,
      ),
    );
  }
}