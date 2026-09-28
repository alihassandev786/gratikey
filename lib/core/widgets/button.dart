import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

import '../constants/appcolor.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final double? textSize;

  final Color? backgroundColor;
  final Color? borderColor;
  final  BorderRadius? borderradius;
  final Color? textColor;

  final Widget? leftWidget;
  final EdgeInsets? leftPadding;
  final Alignment? leftAlignment;

  final Widget? rightWidget;
  final EdgeInsets? rightPadding;
  final Alignment? rightAlignment;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.textSize,
    this.rightWidget,
    this.borderradius,
    this.rightPadding,
    this.rightAlignment,
    this.leftWidget,
    this.leftPadding,
    this.leftAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    // Theme-Aware Colors
    // Primary color ko theme se pick kar rahe hain (0xff94C973)
    final brColor = borderColor ?? Colors.transparent;

    // Text color default white rahega agar background primaryGreen hai
    final txtColor = textColor ?? Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? size.height * 0.06,
        width: width?? double.infinity,
        decoration: BoxDecoration(
          gradient: backgroundColor == null
              ? LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.primary1,
              AppColors.primary2,
            ],
          )
              : null,

          color: backgroundColor,

          borderRadius: borderradius ?? BorderRadius.circular(AppSize.height*0.03),

          border: Border.all(color: brColor),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (leftWidget != null)
              Positioned(
                left: leftPadding?.left ?? size.width * 0.02,
                top: leftPadding?.top,
                bottom: leftPadding?.bottom,
                child: Align(
                  alignment: leftAlignment ?? Alignment.centerLeft,
                  child: Padding(
                    padding: leftPadding ?? EdgeInsets.zero,
                    child: leftWidget!,
                  ),
                ),
              ),

            /// TITLE (CENTER)
            Text(
              title,
              style: TextStyle(
                color: txtColor,
                fontSize: textSize ?? size.width * 0.038,
                fontFamily: "ps",
                fontWeight: FontWeight.w600,
              ),
            ),

            /// RIGHT WIDGET
            if (rightWidget != null)
              Positioned(
                right: rightPadding?.right ?? size.width * 0.02,
                top: rightPadding?.top,
                bottom: rightPadding?.bottom,
                child: Align(
                  alignment: rightAlignment ?? Alignment.centerRight,
                  child: Padding(
                    padding: rightPadding ?? EdgeInsets.zero,
                    child: rightWidget!,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
