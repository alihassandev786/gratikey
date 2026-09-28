import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/goldiconcircle.dart';

/// Radio-style selectable card (Faith Preferences + Report Reasons)
class SelectableOptionCard extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIcon;

  const SelectableOptionCard({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SoftCard(
        radius: AppSize.widthPercent(0.065),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.widthPercent(0.04),
          vertical: AppSize.widthPercent(0.06),
        ),
        child: Row(
          children: [
            if (showIcon && icon != null) ...[
              GoldIconCircle(icon: icon, size: AppSize.widthPercent(0.1)),
              SizedBox(width: AppSize.widthPercent(0.035)),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.036),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.01)),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.031),
                      height: 1.3,
                      color: AppColors.textcolor2.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSize.widthPercent(0.02)),
            Container(
              width: AppSize.widthPercent(0.055),
              height: AppSize.widthPercent(0.055),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isSelected
                    ? LinearGradient(
                        colors: [AppColors.primary1, AppColors.primary2],
                      )
                    : null,
                border: isSelected
                    ? null
                    : Border.all(color: Colors.grey.shade400, width: 1.5),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: AppSize.widthPercent(0.032),
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
