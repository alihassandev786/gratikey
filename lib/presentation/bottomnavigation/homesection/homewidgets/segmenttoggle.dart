import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';


/// 2+ options ka segmented toggle. Selected option par primary gradient aata hai.
/// - [expand]: true = poori width mein barabar segments (Reflection screen)
///             false = content ke mutabiq chota (Home tile)
class SegmentToggle extends StatelessWidget {
  final List<String> labels;
  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double? fontSize;
  final double? height;
  final Color? trackColor;
  final bool expand;

  const SegmentToggle({
    super.key,
    required this.labels,
    required this.icons,
    required this.selectedIndex,
    required this.onChanged,
    this.fontSize,
    this.height,
    this.trackColor,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    final double fs = fontSize ?? AppSize.widthPercent(0.038);
    final double h = height ?? AppSize.widthPercent(0.12);

    return Container(
      height: h,
      padding: EdgeInsets.all(h * 0.1),
      decoration: BoxDecoration(
        color: trackColor ?? Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(h),
      ),
      child: Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(labels.length, (index) {
          final Widget segment = _segment(index, fs, h);
          return expand ? Expanded(child: segment) : segment;
        }),
      ),
    );
  }

  Widget _segment(int index, double fs, double h) {
    final bool selected = index == selectedIndex;
    final Color contentColor = selected ? Colors.white : AppColors.textcolor1;

    Widget label = Text(
      labels[index],
      maxLines: 1,
      style: TextStyle(fontFamily: "pm", fontSize: fs, color: contentColor),
    );
    if (expand) {
      label = Flexible(
        child: FittedBox(fit: BoxFit.scaleDown, child: label),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: fs * 0.9),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: selected
              ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.primary1, AppColors.primary2],
          )
              : null,
          borderRadius: BorderRadius.circular(h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons[index], size: fs * 1.25, color: contentColor),
            SizedBox(width: fs * 0.35),
            label,
          ],
        ),
      ),
    );
  }
}
