import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/breathcontroller.dart';
import '../../homesection/homewidgets/softcard.dart';
import 'accessbadge.dart';
import 'audioprogressbar.dart';
import 'audiotrack.dart';
import 'playcirclebutton.dart';

/// Audio Sanctuary list ka ek track card (Key Teachings / Guided Meditations).
/// Ye track chal raha ho to neeche progress bar + time bhi dikhta hai.
class AudioTrackCard extends StatelessWidget {
  final BreathController controller;
  final AudioTrack track;

  const AudioTrackCard({
    super.key,
    required this.controller,
    required this.track,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool current = controller.isCurrent(track);

      return SoftCard(
        onTap: () => controller.playTrack(track),
        radius: AppSize.widthPercent(0.08),
        padding: EdgeInsets.all(AppSize.widthPercent(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PlayCircleButton(
                  size: AppSize.widthPercent(0.12),
                  playing: controller.isPlayingTrack(track),
                  loading: controller.isLoadingTrack(track),
                  onTap: () => controller.playTrack(track),
                ),
                SizedBox(width: AppSize.widthPercent(0.04)),
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
                          fontSize: AppSize.widthPercent(0.047),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.widthPercent(0.008)),
                      Text(
                        track.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.036),
                          color: AppColors.textcolor2.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.widthPercent(0.035)),

            AccessBadge(premium: track.isPremium),

            if (current) ...[
              SizedBox(height: AppSize.widthPercent(0.02)),
              Row(
                children: [
                  Expanded(
                    child: AudioProgressBar(
                      progress: controller.audioProgress,
                      onSeek: controller.seekToFraction,
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.03)),
                  Text(
                    controller.trackTimeText(track),
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.03),
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      );
    });
  }
}
