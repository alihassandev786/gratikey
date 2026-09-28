import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// 12 keys ki segmented progress bar.
/// index < unlocked = gold, index == unlocked = active (dark grey), baaki light grey.
class KeysProgressBar extends StatelessWidget {
  final int total;
  final int unlocked;

  const KeysProgressBar({
    super.key,
    required this.total,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (index) {
        final Color color = index < unlocked
            ? AppColors.secondary1
            : index == unlocked
            ? const Color(0xff7A7A7A)
            : Colors.black.withOpacity(0.08);

        return Expanded(
          child: Container(
            height: AppSize.widthPercent(0.02),
            margin: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.004)),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      }),
    );
  }
}
