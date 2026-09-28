import 'package:flutter/material.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

/// Soft cream notification card used in Notifications screen.
class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String time;

  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width * 0.045,
        vertical: AppSize.height * 0.022,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary3,
        borderRadius: BorderRadius.circular(AppSize.height * 0.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.width * 0.04,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textcolor1,
                  ),
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.width * 0.03,
                  color: AppColors.secondary1,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.height * 0.008),
          Text(
            body,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.width * 0.035,
              color: AppColors.textcolor2,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
