import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

/// Reusable soft cream rounded settings row used across Profile section.
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool showArrow;
  final Color? iconBgColor;
  final Color? iconColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.showArrow = true,
    this.iconBgColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.height * 0.01),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width * 0.04,
          vertical: AppSize.height * 0.014,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondary3,
          borderRadius: BorderRadius.circular(AppSize.height * 0.04),
        ),
        child: Row(
          children: [
            Container(
              width: AppSize.width * 0.11,
              height: AppSize.width * 0.11,
              decoration: BoxDecoration(
                color: iconBgColor ?? AppColors.secondary1.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.secondary1,
                size: AppSize.width * 0.055,
              ),
            ),
            SizedBox(width: AppSize.width * 0.035),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.width * 0.038,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textcolor1,
                ),
              ),
            ),
            if (showArrow)
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: AppSize.width * 0.04,
                color: AppColors.textcolor2.withOpacity(0.6),
              ),
          ],
        ),
      ),
    );
  }
}
