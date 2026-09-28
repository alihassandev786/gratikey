import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/breathcontroller.dart';
import '../../homesection/homewidgets/softcard.dart';
import 'audioprogressbar.dart';
import 'audiotrack.dart';
import 'playcirclebutton.dart';

/// Audio Sanctuary ka upar wala "Free Daily Sanctuary" bara card.
class FeaturedAudioCard extends StatelessWidget {
  final BreathController controller;
  final AudioTrack track;

  const FeaturedAudioCard({
    super.key,
    required this.controller,
    required this.track,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      radius: AppSize.widthPercent(0.09),
      padding: EdgeInsets.all(AppSize.widthPercent(0.065)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LABEL
          Row(
            children: [
              Icon(
                Icons.hourglass_bottom_rounded,
                color: AppColors.textcolor1,
                size: AppSize.widthPercent(0.045),
              ),
              SizedBox(width: AppSize.widthPercent(0.03)),
              Text(
                controller.featuredLabel,
                style: TextStyle(
                  fontFamily: "pm",
                  fontSize: AppSize.widthPercent(0.033),
                  color: AppColors.secondary1,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.widthPercent(0.035)),

          /// TITLE
          Text(
            track.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "pm",
              fontSize: AppSize.widthPercent(0.05),
              color: AppColors.textcolor1,
            ),
          ),

          SizedBox(height: AppSize.widthPercent(0.02)),

          /// DESCRIPTION
          Text(
            controller.featuredDescription,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.036),
              height: 1.35,
              color: AppColors.textcolor2,
            ),
          ),

          SizedBox(height: AppSize.widthPercent(0.04)),

          /// PROGRESS
          Obx(() {
            final bool current = controller.isCurrent(track);
            return AudioProgressBar(
              progress: current ? controller.audioProgress : 0.0,
              onSeek: current ? controller.seekToFraction : null,
            );
          }),

          SizedBox(height: AppSize.widthPercent(0.03)),

          /// PLAY + TIME
          Obx(() {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PlayCircleButton(
                  size: AppSize.widthPercent(0.107),
                  playing: controller.isPlayingTrack(track),
                  loading: controller.isLoadingTrack(track),
                  onTap: () => controller.playTrack(track),
                ),
                SizedBox(width: AppSize.widthPercent(0.035)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.trackTimeText(track),
                        style: TextStyle(
                          fontFamily: "pm",
                          fontSize: AppSize.widthPercent(0.036),
                          color: AppColors.secondary1,
                        ),
                      ),
                      SizedBox(height: AppSize.widthPercent(0.005)),
                      Text(
                        controller.trackStatusText(track),
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.03),
                          color: AppColors.textcolor2.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
