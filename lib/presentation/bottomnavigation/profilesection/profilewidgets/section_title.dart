import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

/// Section header text used in Profile screen (Preferences / General).
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: "pr",
        fontSize: AppSize.width * 0.04,
        fontWeight: FontWeight.w700,
        color: AppColors.textcolor1,
      ),
    );
  }
}
