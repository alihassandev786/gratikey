import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/goldiconcircle.dart';

/// Toggle switch card used in Reminder Preferences
class TogglePreferenceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const TogglePreferenceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      radius: AppSize.widthPercent(0.07),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.04),
        vertical: AppSize.widthPercent(0.05),
      ),
      child: Row(
        children: [
          GoldIconCircle(
            icon: icon,
            size: AppSize.widthPercent(0.1),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "pm",
                    fontSize: AppSize.widthPercent(0.035),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.widthPercent(0.008)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.031),
                    color: AppColors.textcolor2.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          // ✅ Custom Gradient Toggle
          GestureDetector(
            onTap: () => onChanged(!value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: AppSize.widthPercent(0.12),
              height: AppSize.widthPercent(0.065),
              padding: EdgeInsets.all(AppSize.widthPercent(0.008)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: value
                    ? LinearGradient(
                  colors: [
                    AppColors.primary1,
                    AppColors.primary2,
                  ],
                )
                    : null,
                color: value ? null : Colors.grey.shade300,
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 220),
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: AppSize.widthPercent(0.048),
                  height: AppSize.widthPercent(0.048),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}