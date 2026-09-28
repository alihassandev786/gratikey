import 'package:flutter/material.dart';

import '../../../core/widgets/appheader.dart';
import '../../../core/widgets/background.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../data/controllers/breathcontroller.dart';
import 'breathwidgets/audioplayerbar.dart';
import 'breathwidgets/audiotrackcard.dart';
import 'breathwidgets/featuredaudiocard.dart';
import 'breathwidgets/sectionheading.dart';

/// Audio Sanctuary — Free Daily Sanctuary + Key Teachings + Guided Meditations
/// + neeche mini player.
class AudioSessionsScreen extends StatelessWidget {
  AudioSessionsScreen({super.key});

  final BreathController controller = BreathController.to;

  @override
  Widget build(BuildContext context) {
    final double side = AppSize.widthPercent(0.053);
    final double gap = AppSize.widthPercent(0.04);

    return AppBackground(
      child: Column(
        children: [
          SizedBox(height: AppSize.heightPercent(0.01)),

          /// HEADER
          Padding(
            padding: EdgeInsets.symmetric(horizontal: side),
            child: Appheader(
              title: controller.audioScreenTitle,
              showBackButton: true,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: side),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// FREE DAILY SANCTUARY
                  FeaturedAudioCard(
                    controller: controller,
                    track: controller.featuredTrack,
                  ),

                  SizedBox(height: AppSize.widthPercent(0.08)),

                  /// KEY TEACHINGS & REFLECTIONS
                  SectionHeading(
                    title: controller.teachingsTitle,
                  ),
                  SizedBox(height: AppSize.widthPercent(0.045)),

                  ...controller.keyTeachings.map(
                    (track) => Padding(
                      padding: EdgeInsets.only(bottom: gap),
                      child: AudioTrackCard(
                        controller: controller,
                        track: track,
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.widthPercent(0.04)),

                  /// GUIDED MEDITATIONS
                  SectionHeading(
                    title: controller.meditationsTitle,
                  ),
                  SizedBox(height: AppSize.widthPercent(0.045)),

                  ...controller.guidedMeditations.map(
                    (track) => Padding(
                      padding: EdgeInsets.only(bottom: gap),
                      child: AudioTrackCard(
                        controller: controller,
                        track: track,
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.widthPercent(0.04)),
                ],
              ),
            ),
          ),

          /// MINI PLAYER (track chalne par hi dikhta hai)
          AudioPlayerBar(controller: controller),
        ],
      ),
    );
  }
}
