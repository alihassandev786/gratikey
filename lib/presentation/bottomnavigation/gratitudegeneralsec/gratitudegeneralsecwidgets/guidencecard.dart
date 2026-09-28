import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/softcard.dart';

/// Detail screen par shield icon + reflection guidance tip.
class GuidanceCard extends StatelessWidget {
  final String text;

  const GuidanceCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      color: Colors.white.withOpacity(0.55),
      shadow: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined,
              size: AppSize.widthPercent(0.05), color: AppColors.textcolor1),
          SizedBox(width: AppSize.widthPercent(0.03)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.031),
                height: 1.45,
                color: AppColors.textcolor1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}