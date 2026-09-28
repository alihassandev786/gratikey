import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/goldpill.dart';

/// "Key Reflection" label + meta pill (misal "Morning Quiet. 7:42AM").
/// Create aur Edit Journal Entry screens dono mein yehi row use hoti hai,
/// isliye common widget ke tor par yahan alag rakha gaya hai.
class EntryMetaRow extends StatelessWidget {
  final String label;
  final String meta;
  final IconData metaIcon;

  const EntryMetaRow({
    super.key,
    required this.label,
    required this.meta,
    this.metaIcon = Icons.wb_twilight_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "pr",
            fontSize: AppSize.widthPercent(0.035),
            color: AppColors.secondary1,
          ),
        ),
        SizedBox(width: AppSize.widthPercent(0.025)),
        Flexible(child: GoldPill(text: meta, icon: metaIcon)),
      ],
    );
  }
}