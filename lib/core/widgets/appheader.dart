import 'package:flutter/material.dart';

import '../constants/appcolor.dart';
import 'Backbutton.dart';
import 'mediaquery.dart';
class Appheader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBack;
  final String? profileImage;
  final Widget? rightWidget;
  final Color? backgroundColor;
  final double? titleSize;
  final ImageProvider? imageProvider;
  final double? subtitleSize;
  final EdgeInsets? padding;

  const Appheader({
    super.key,
    this.imageProvider,
    required this.title,
    this.subtitle,
    this.showBackButton = false,
    this.onBack,
    this.profileImage,
    this.rightWidget,
    this.backgroundColor,
    this.titleSize,
    this.subtitleSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // Theme-Aware Colors
    final textColor = AppColors.textcolor1;
    final subTitleColor = AppColors.textcolor2;

    return Container(
      width: double.infinity,
      padding: padding ??
          EdgeInsets.only(
            top: AppSize.height * 0.015,
            left: 0,
            right: 0,
            bottom: AppSize.height * 0.02,
          ),
      color: backgroundColor ?? Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT ELEMENT
          /// LEFT ELEMENT
          if (showBackButton)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Custombackbutton(onTap: onBack),
            )
          else if (profileImage != null)
            Padding(
              padding: EdgeInsets.only(right: AppSize.height * 0.01),
              child: Container(
                height: AppSize.height * 0.06,
                width: AppSize.height * 0.06,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary1.withOpacity(0.15),
                  image: DecorationImage(
                    image: AssetImage(profileImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          /// TITLE AREA
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "pr",
                    color: textColor, // Dynamic text color
                    fontSize: titleSize ?? AppSize.height*0.023,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: subTitleColor, // Dynamic subtitle color
                      fontFamily: "pr",
                      fontSize: subtitleSize ?? AppSize.width * 0.035,
                    ),
                  ),
                ],
              ],
            ),
          ),

          /// RIGHT SIDE
          if (rightWidget != null) rightWidget!,
        ],
      ),
    );
  }
}