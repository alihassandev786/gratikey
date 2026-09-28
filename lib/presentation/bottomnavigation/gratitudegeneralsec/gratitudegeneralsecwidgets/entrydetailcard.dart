import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/goldpill.dart';
import '../../homesection/homewidgets/softcard.dart';

/// Journal Entry Detail screen ka main card: "Private & Secure Entry" label,
/// poora text, aur neeche date pill.
class EntryDetailCard extends StatelessWidget {
  final String text;
  final String dateLabel;

  const EntryDetailCard({
    super.key,
    required this.text,
    required this.dateLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: AppSize.height*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Private & Secure Entry",
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.031),
                color: AppColors.secondary1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.035)),
            Text(
              text,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.038),
                height: 1.55,
                color: AppColors.textcolor1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.045)),
            GoldPill(text: dateLabel, icon: Icons.calendar_today_rounded),
          ],
        ),
      ),
    );
  }
}