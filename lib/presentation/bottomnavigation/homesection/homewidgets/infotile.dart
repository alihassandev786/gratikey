import 'package:flutter/material.dart';
import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import 'softcard.dart';

/// Row-style card: leading (icon/number) + title + subtitle.
/// - [titleTrailing]: title ki line ke right par (misal "45 sec")
/// - [trailing]: card ke right side par vertically center (misal toggle)
class InfoTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? titleTrailing;
  final VoidCallback? onTap;
  final Color? color;
  final bool shadow;

  const InfoTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.titleTrailing,
    this.onTap,
    this.color,
    this.shadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: onTap,
      color: color,
      shadow: shadow,
      radius: AppSize.widthPercent(0.065),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.045),
        vertical: AppSize.widthPercent(0.06),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading,
          SizedBox(width: AppSize.widthPercent(0.04)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: "pm",
                          fontSize: AppSize.widthPercent(0.04),
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ),
                    if (titleTrailing != null) titleTrailing!,
                  ],
                ),
                SizedBox(height: AppSize.widthPercent(0.01)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    height: 1.3,
                    color: AppColors.textcolor2.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: AppSize.widthPercent(0.02)),
            trailing!,
          ],
        ],
      ),
    );
  }
}
