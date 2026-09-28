import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

class SoftInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool expands;
  final Widget? prefix;
  final Color? backgroundcolor;
  final IconData? prefixIcon;
  final Widget? suffix;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final double? height;
  final TextAlignVertical? textAlignVertical;
  final String? fontfamily;
  final String? hintfontfamily;

  const SoftInputField({
    super.key,
    this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.expands = false,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.backgroundcolor,
    this.suffixIcon,
    this.onSuffixTap,
    this.height,
    this.textAlignVertical,
    this.fontfamily,
    this.hintfontfamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppSize.height * 0.058,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width * 0.04,
        vertical: AppSize.height * 0.004,
      ),
      decoration: BoxDecoration(
        color: backgroundcolor ?? Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSize.height * 0.04),
      ),
      child: Row(
        crossAxisAlignment:
        expands ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (prefix != null) prefix!,
          if (prefixIcon != null)
            Icon(
              prefixIcon,
              color: AppColors.textcolor2,
              size: AppSize.width * 0.055,
            ),
          SizedBox(width: AppSize.height*0.01,),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              maxLines: expands ? null : maxLines,
              expands: expands,
              textAlignVertical:
              textAlignVertical ?? (expands ? TextAlignVertical.top : null),
              style: TextStyle(
                fontFamily: fontfamily?? "pr",
                fontSize: AppSize.width * 0.038,
                color: AppColors.textcolor1,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: hintfontfamily?? "pr",
                  fontSize: AppSize.width * 0.035,
                  color: AppColors.textcolor2.withOpacity(0.55),
                ),
              ),
            ),
          ),
          if (suffix != null) suffix!,
          if (suffixIcon != null)
            GestureDetector(
              onTap: onSuffixTap,
              child: Icon(
                suffixIcon,
                color: AppColors.secondary1,
                size: AppSize.width * 0.055,
              ),
            ),
        ],
      ),
    );
  }
}