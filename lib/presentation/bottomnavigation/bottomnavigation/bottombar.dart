import 'package:flutter/material.dart';
import '../../../core/constants/appcolor.dart';
import '../../../core/widgets/mediaquery.dart';

class BottomBarItem {
  final IconData icon;
  final String label;

  const BottomBarItem({required this.icon, required this.label});
}

class AppBottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final String backgroundImage;

  const AppBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundImage = 'assets/images/bottomnavbg.png',
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final barHeight = AppSize.heightPercent(0.085);

    return Container(
      height: barHeight + bottomInset,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.widthPercent(0.06)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isSelected = index == currentIndex;
            final item = items[index];

            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(index),
                child: SizedBox(
                  height: barHeight,
                  child: Center(
                    child: Icon(
                      item.icon,
                      size: AppSize.widthPercent(0.065),
                      color: isSelected
                          ? AppColors.primary2
                          : const Color(0xFF6B6B6B),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}