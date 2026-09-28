import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';

/// Soft-themed image source bottom sheet matching GratiKey design.
class ImagePickerBottomSheet {
  static void show({
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width * 0.05,
          vertical: AppSize.height * 0.025,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8F0),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// HANDLE BAR
            Container(
              width: AppSize.width * 0.14,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.secondary1.withOpacity(0.35),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            SizedBox(height: AppSize.height * 0.022),

            /// TITLE
            Text(
              "Select Image Source",
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.width * 0.048,
                fontWeight: FontWeight.w700,
                color: AppColors.textcolor1,
              ),
            ),

            SizedBox(height: AppSize.height * 0.03),

            Row(
              children: [
                _buildOption(
                  icon: Icons.camera_alt_rounded,
                  label: "Camera",
                  onTap: () {
                    Get.back();
                    onCameraTap();
                  },
                ),
                SizedBox(width: AppSize.width * 0.04),
                _buildOption(
                  icon: Icons.photo_library_rounded,
                  label: "Gallery",
                  onTap: () {
                    Get.back();
                    onGalleryTap();
                  },
                ),
              ],
            ),

            SizedBox(height: AppSize.height * 0.04),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: true,
    );
  }

  static Widget _buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.022),
          decoration: BoxDecoration(
            color: AppColors.secondary3,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.secondary1.withOpacity(0.25),
              width: 1.2,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: AppSize.width * 0.14,
                height: AppSize.width * 0.14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary1.withOpacity(0.25),
                      AppColors.primary2.withOpacity(0.25),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  icon,
                  color: AppColors.secondary1,
                  size: AppSize.width * 0.07,
                ),
              ),
              SizedBox(height: AppSize.height * 0.012),
              Text(
                label,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.width * 0.038,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textcolor1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}