import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/goldiconcircle.dart';

/// Common icon + text row used in Block / Mute confirmation & Guidelines
class InfoPointRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? highlightWord;

  const InfoPointRow({
    super.key,
    required this.icon,
    required this.text,
    this.highlightWord,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GoldIconCircle(
          icon: icon,
          size: AppSize.widthPercent(0.075),
        ),
        SizedBox(width: AppSize.widthPercent(0.03)),
        Expanded(
          child: highlightWord != null
              ? RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.03),
                      height: 1.35,
                      color: AppColors.textcolor1,
                    ),
                    children: [
                      TextSpan(text: text.split(highlightWord!)[0]),
                      TextSpan(
                        text: highlightWord,
                        style: TextStyle(
                          fontFamily: "pm",
                          color: AppColors.secondary1,
                        ),
                      ),
                      if (text.split(highlightWord!).length > 1)
                        TextSpan(text: text.split(highlightWord!)[1]),
                    ],
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.028),
                    height: 1.35,
                    color: AppColors.textcolor1,
                  ),
                ),
        ),
      ],
    );
  }
}
