import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Section ka heading: [icon] + title, aur right par optional link (misal "View Audio Sessions").
class SectionHeading extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? actionText;
  final VoidCallback? onActionTap;
  final double? fontSize;

  const SectionHeading({
    super.key,
    required this.title,
    this.icon,
    this.actionText,
    this.onActionTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: AppColors.textcolor1,
            size: AppSize.widthPercent(0.065),
          ),
          SizedBox(width: AppSize.widthPercent(0.02)),
        ],
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "pm",
              fontSize: fontSize ?? AppSize.widthPercent(0.043),
              color: AppColors.textcolor1,
            ),
          ),
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.033),
                color: AppColors.secondary1,
              ),
            ),
          ),
      ],
    );
  }
}
