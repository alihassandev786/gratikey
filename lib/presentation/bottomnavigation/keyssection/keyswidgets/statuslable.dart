import 'package:flutter/material.dart';

import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/keyscontroller.dart';

/// Key card ke top-right corner wala chota status text
/// (Completed / In Progress / Upcoming) — color status ke hisab se badal jata hai.
class StatusLabel extends StatelessWidget {
  final KeyStatus status;

  const StatusLabel({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color color;

    switch (status) {
      case KeyStatus.completed:
        text = "Completed";
        color = const Color(0xff2E9E5B);
        break;
      case KeyStatus.inProgress:
        text = "In Progress";
        color = const Color(0xffDD8A3E);
        break;
      case KeyStatus.upcoming:
        text = "Upcoming";
        color = const Color(0xff9B9B9B);
        break;
    }

    return Text(
      text,
      style: TextStyle(
        fontFamily: "pm",
        fontWeight: FontWeight.w600,
        fontSize: AppSize.widthPercent(0.031),
        color: color,
      ),
    );
  }
}