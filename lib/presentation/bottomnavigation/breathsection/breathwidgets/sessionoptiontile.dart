import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/goldiconcircle.dart';
import '../../homesection/homewidgets/infotile.dart';
import 'breathsession.dart';
import 'gradientcheckcircle.dart';

/// Breathing Sessions list ka ek card (timer icon + title + subtitle + radio).
class SessionOptionTile extends StatelessWidget {
  final BreathSession session;
  final bool selected;
  final VoidCallback onTap;

  const SessionOptionTile({
    super.key,
    required this.session,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InfoTile(
      onTap: onTap,
      leading: GoldIconCircle(
        icon: Icons.timer_outlined,
        size: AppSize.widthPercent(0.107),
        backgroundColor: AppColors.secondary1.withOpacity(0.25),
      ),
      title: session.title,
      subtitle: session.subtitle,
      trailing: GradientCheckCircle(selected: selected),
    );
  }
}
