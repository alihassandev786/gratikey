import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/softcard.dart';

/// "Recent Reflections" list mein har entry ka card (date, preview, tag, View Entry).
class EntryListCard extends StatelessWidget {
  final String dateLabel;
  final String preview;
  final String tag;
  final VoidCallback onView;

  const EntryListCard({
    super.key,
    required this.dateLabel,
    required this.preview,
    required this.tag,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: onView,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: AppSize.height*0.01,horizontal: AppSize.height*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dateLabel,
              style: TextStyle(
                fontFamily: "pm",
                fontSize: AppSize.widthPercent(0.03),
                color: AppColors.secondary1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.025)),
            Text(
              "\u201C$preview\u201D",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.03),
                height: 1.4,
                color: AppColors.textcolor1,
              ),
            ),
            SizedBox(height: AppSize.widthPercent(0.035)),
            Row(
              children: [
                Icon(Icons.lock_rounded,
                    size: AppSize.widthPercent(0.04), color: AppColors.textcolor2),
                SizedBox(width: AppSize.widthPercent(0.015)),
                Expanded(
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.033),
                      color: AppColors.textcolor2,
                    ),
                  ),
                ),
                CustomButton(
                  title: "View Entry",
                  onTap: onView,
                  width: AppSize.widthPercent(0.32),
                  height: AppSize.widthPercent(0.1),
                  textSize: AppSize.widthPercent(0.032),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}