import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../../../../data/controllers/breathcontroller.dart';
import '../../homesection/homewidgets/goldiconcircle.dart';
import '../../homesection/homewidgets/softcard.dart';
import 'audiotrack.dart';
import 'playcirclebutton.dart';

/// Breath tab ke "Guided Audio" section ka ek card.
/// Free = gold play button + headphones, Premium = note/moon icon + lock.
class GuidedAudioTile extends StatelessWidget {
  final BreathController controller;
  final AudioTrack track;

  const GuidedAudioTile({
    super.key,
    required this.controller,
    required this.track,
  });

  @override
  Widget build(BuildContext context) {
    final double circle = AppSize.widthPercent(0.107);

    return Obx(() {
      final bool playing = controller.isPlayingTrack(track);
      final bool loading = controller.isLoadingTrack(track);

      return SoftCard(
        onTap: () => controller.playTrack(track),
        radius: AppSize.widthPercent(0.065),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.widthPercent(0.045),
          vertical: AppSize.widthPercent(0.06),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// LEADING
            if (track.isPremium)
              GoldIconCircle(icon: track.icon, size: circle)
            else
              PlayCircleButton(
                size: circle,
                playing: playing,
                loading: loading,
                onTap: () => controller.playTrack(track),
              ),

            SizedBox(width: AppSize.widthPercent(0.04)),

            /// TITLE + META
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
                      fontSize: AppSize.widthPercent(0.042),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.widthPercent(0.01)),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: AppSize.widthPercent(0.02),
                    children: [
                      Text(
                        track.durationLabel,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.033),
                          color: AppColors.textcolor2.withOpacity(0.75),
                        ),
                      ),
                      if (track.isPremium)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.key_rounded,
                              color: AppColors.secondary1,
                              size: AppSize.widthPercent(0.042),
                            ),
                            SizedBox(width: AppSize.widthPercent(0.01)),
                            Text(
                              track.subtitle,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.03),
                                color: AppColors.secondary1,
                              ),
                            ),
                          ],
                        )
                      else
                        Text(
                          "\u2022 ${track.subtitle}",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.secondary1,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: AppSize.widthPercent(0.02)),

            /// TRAILING
            if (track.isPremium)
              Container(
                width: circle,
                height: circle,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffA9A296),
                ),
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white,
                  size: circle * 0.48,
                ),
              )
            else
              Icon(
                playing ? Icons.graphic_eq_rounded : Icons.headphones_rounded,
                color: AppColors.secondary1,
                size: AppSize.widthPercent(0.065),
              ),
          ],
        ),
      );
    });
  }
}
