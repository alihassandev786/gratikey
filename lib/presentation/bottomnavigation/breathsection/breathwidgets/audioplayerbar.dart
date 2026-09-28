import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/breathcontroller.dart';
import '../../homesection/homewidgets/goldiconcircle.dart';
import 'audioprogressbar.dart';
import 'playcirclebutton.dart';

/// Audio Sanctuary ka neeche wala mini player (track chalte hi nazar aata hai):
/// title + replay 10 + play/pause + forward 10 + seekable progress bar.
class AudioPlayerBar extends StatelessWidget {
  final BreathController controller;

  const AudioPlayerBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final track = controller.currentTrack.value;
      if (track == null) return const SizedBox.shrink();

      final double side = AppSize.widthPercent(0.053);

      return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          side,
          AppSize.widthPercent(0.035),
          side,
          AppSize.widthPercent(0.025),
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.55),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSize.widthPercent(0.07)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: AppSize.widthPercent(0.04),
              offset: Offset(0, -AppSize.widthPercent(0.01)),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GoldIconCircle(
                  icon: Icons.music_note_rounded,
                  size: AppSize.widthPercent(0.107),
                  backgroundColor: AppColors.secondary1,
                  iconColor: Colors.white,
                ),
                SizedBox(width: AppSize.widthPercent(0.035)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        track.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "pm",
                          fontSize: AppSize.widthPercent(0.04),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.widthPercent(0.005)),
                      Text(
                        track.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.033),
                          color: AppColors.textcolor2.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.skipBy(const Duration(seconds: -10)),
                  child: Icon(
                    Icons.replay_10_rounded,
                    color: AppColors.secondary1,
                    size: AppSize.widthPercent(0.08),
                  ),
                ),
                SizedBox(width: AppSize.widthPercent(0.025)),
                PlayCircleButton(
                  size: AppSize.widthPercent(0.13),
                  playing: controller.isPlaying.value,
                  loading: controller.isAudioLoading.value,
                  onTap: controller.togglePlayPause,
                ),
                SizedBox(width: AppSize.widthPercent(0.025)),
                GestureDetector(
                  onTap: () => controller.skipBy(const Duration(seconds: 10)),
                  child: Icon(
                    Icons.forward_10_rounded,
                    color: AppColors.secondary1,
                    size: AppSize.widthPercent(0.08),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.widthPercent(0.01)),

            Row(
              children: [
                Text(
                  controller.positionText,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    color: AppColors.textcolor2,
                  ),
                ),
                SizedBox(width: AppSize.widthPercent(0.025)),
                Expanded(
                  child: AudioProgressBar(
                    progress: controller.audioProgress,
                    onSeek: controller.seekToFraction,
                  ),
                ),
                SizedBox(width: AppSize.widthPercent(0.025)),
                Text(
                  controller.durationText,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.03),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
