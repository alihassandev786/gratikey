import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../homesection/homewidgets/softcard.dart';

/// Bara likhne wala area — Create aur Edit Journal Entry dono screens mein
/// yehi widget use hota hai, sirf [showEditIcon] aur pre-filled text mein farq hota hai.
class EntryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool showEditIcon;
  final double? minHeight;

  const EntryTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.showEditIcon = false,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      color: Colors.grey.withOpacity(0.1),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.05),
        vertical: AppSize.widthPercent(0.045),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: minHeight ?? AppSize.heightPercent(0.34),
        ),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              minLines: 8,
              maxLines: null,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.04),
                height: 1.55,
                color: AppColors.textcolor1,
              ),
              cursorColor: AppColors.secondary1,
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.04),
                  height: 1.55,
                  color: AppColors.textcolor2.withOpacity(0.5),
                ),
              ),
            ),
            if (showEditIcon)
              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.edit_rounded,
                  size: AppSize.widthPercent(0.05),
                  color: AppColors.primary2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}