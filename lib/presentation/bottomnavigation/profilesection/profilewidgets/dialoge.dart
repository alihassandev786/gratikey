// File: lib/presentation/bottomnavigation/profilesection/profilewidgets/confirmdialog.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;
  final Color? confirmColor;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.cancelText = "Cancel",
    this.confirmText = "Confirm",
    this.confirmColor,
    required this.onConfirm,
    this.onCancel,
  });

  /// ✅ Context ki zaroorat nahi – GetX se call karo
  static void show({
    required String title,
    required String message,
    String cancelText = "Cancel",
    String confirmText = "Confirm",
    Color? confirmColor,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      ConfirmDialog(
        title: title,
        message: message,
        cancelText: cancelText,
        confirmText: confirmText,
        confirmColor: confirmColor,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.1),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary3,
          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSize.widthPercent(0.06),
                AppSize.widthPercent(0.06),
                AppSize.widthPercent(0.06),
                AppSize.widthPercent(0.04),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontSize: AppSize.widthPercent(0.045),
                      color: confirmColor ?? Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.025)),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.034),
                      height: 1.4,
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.08),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                        onCancel?.call();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSize.widthPercent(0.04),
                        ),
                      ),
                      child: Text(
                        cancelText,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.038),
                          color: AppColors.textcolor2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.black.withOpacity(0.08),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                        onConfirm();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSize.widthPercent(0.04),
                        ),
                      ),
                      child: Text(
                        confirmText,
                        style: TextStyle(
                          fontFamily: "pm",
                          fontSize: AppSize.widthPercent(0.038),
                          color: confirmColor ?? AppColors.secondary1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}