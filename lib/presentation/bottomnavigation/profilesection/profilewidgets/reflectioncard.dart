import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/homesection/homewidgets/softcard.dart';

/// Common reflection / comment card used in Community Wall & Discussion
class ReflectionCard extends StatelessWidget {
  final String name;
  final String time;
  final String text;
  final String image;
  final VoidCallback? onMute;
  final VoidCallback? onReport;
  final VoidCallback? onBlock;

  const ReflectionCard({
    super.key,
    required this.name,
    required this.time,
    required this.text,
    required this.image,
    this.onMute,
    this.onReport,
    this.onBlock,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      radius: AppSize.widthPercent(0.05),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.04),
        vertical: AppSize.widthPercent(0.055),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppSize.widthPercent(0.05),
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: name,
                              style: TextStyle(
                                fontFamily: "pm",
                                fontSize: AppSize.widthPercent(0.036),
                                color: AppColors.textcolor1,
                              ),
                            ),
                            TextSpan(
                              text: "  $time",
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.028),
                                color: AppColors.secondary1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// 3 DOTS MENU
                    PopupMenuButton<String>(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.more_vert_rounded,
                        size: AppSize.widthPercent(0.05),
                        color: AppColors.textcolor1,
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppSize.widthPercent(0.04)),
                      ),
                      onSelected: (value) {
                        if (value == 'mute') {
                          onMute?.call();
                        } else if (value == 'report') {
                          onReport?.call();
                        } else if (value == 'block') {
                          onBlock?.call();
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'mute',
                          child: Text(
                            "Mute Member",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.034),
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'report',
                          child: Text(
                            "Report Content",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.034),
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'block',
                          child: Text(
                            "Block Member",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.034),
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.032),
                    height: 1.35,
                    color: AppColors.textcolor1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}