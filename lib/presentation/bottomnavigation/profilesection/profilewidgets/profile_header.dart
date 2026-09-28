import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gratikey/core/constants/appcolor.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import 'package:gratikey/presentation/bottomnavigation/profilesection/profilewidgets/header_wave_clipper.dart';

/// Shared header.
/// - Main Profile  → wave clip + avatar (no camera, no back)
/// - Edit Profile  → soft rounded cover + centered camera on avatar + simple back icon
class ProfileHeader extends StatelessWidget {
  final ImageProvider coverImage;
  final ImageProvider profileImage;
  final bool isEditMode;
  final VoidCallback? onCameraTap;
  final double? height;
  final double? coverHeight;

  const ProfileHeader({
    super.key,
    required this.coverImage,
    required this.profileImage,
    this.isEditMode = false,
    this.onCameraTap,
    this.height,
    this.coverHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditMode) {
      return _buildEditHeader();
    }
    return _buildProfileHeader();
  }

  /// ========== MAIN PROFILE HEADER (wave clip) ==========
  Widget _buildProfileHeader() {
    final double totalHeight = height ?? AppSize.height * 0.32;
    final double coverH = coverHeight ?? AppSize.height * 0.26;

    return SizedBox(
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: HeaderWaveClipper(),
            child: Container(
              height: coverH,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Image(
                image: coverImage,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.primary1.withOpacity(0.25),
                ),
              ),
            ),
          ),
          Positioned(
            left: AppSize.width * 0.08,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: AppSize.width * 0.095,
                backgroundImage: profileImage,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ========== EDIT PROFILE HEADER (matches design image) ==========
  Widget _buildEditHeader() {
    final double totalHeight = height ?? AppSize.height * 0.34;
    final double coverH = coverHeight ?? AppSize.height * 0.28;

    return SizedBox(
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Soft rounded cover
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.width * 0.08),
              topRight: Radius.circular(AppSize.width * 0.08),
              bottomLeft: Radius.circular(AppSize.width * 0.12),
              bottomRight: Radius.circular(AppSize.width * 0.08),
            ),
            child: Container(
              height: coverH,
              width: double.infinity,
              color: Colors.transparent,
              child: Image(
                image: coverImage,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.primary1.withOpacity(0.25),
                ),
              ),
            ),
          ),

          /// Simple white back chevron
          Positioned(
            top: AppSize.height * 0.02,
            left: AppSize.width * 0.03,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(AppSize.width * 0.02),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: AppSize.width * 0.055,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Avatar with CAMERA ICON CENTERED
          Positioned(
            left: AppSize.width * 0.08,
            bottom: 0,
            child: GestureDetector(
              onTap: onCameraTap,
              child: Container(
                width: AppSize.width * 0.2,
                height: AppSize.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: profileImage,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.primary1.withOpacity(0.3),
                        ),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.35),
                      ),
                      Center(
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: AppSize.width * 0.07,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}