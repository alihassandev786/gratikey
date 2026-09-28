import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Gradient pill button jis mein icon + title saath center mein hon.
/// (CustomButton sirf title deta hai — ye icon wala variant hai.)
class GradientIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? fontSize;

  const GradientIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final double h = height ?? AppSize.height * 0.06;
    final double fs = fontSize ?? AppSize.width * 0.038;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.primary1, AppColors.primary2],
          ),
          borderRadius: BorderRadius.circular(h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: fs * 1.35),
            SizedBox(width: fs * 0.5),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "ps",
                fontWeight: FontWeight.w600,
                fontSize: fs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
