import 'package:flutter/material.dart';

/// Ek audio ka data (Guided Audio, Key Teachings, Guided Meditations).
///
/// Abhi sab tracks ek hi file `assets/audio/completevoice.mp3` chalate hain.
/// Har track ki apni awaaz lagani ho to us track ka [asset] path badal dein,
/// misal: asset: 'assets/audio/key1.mp3'
class AudioTrack {
  static const String defaultAsset = 'assets/audio/completevoice.mp3';

  final String id;
  final String title;
  final String subtitle;

  /// Sirf dikhane ke liye (misal "4:30" ya "7 min").
  /// Jab track chal raha ho to asli duration player se aati hai.
  final String durationLabel;

  final bool isPremium;
  final String asset;
  final IconData icon;

  const AudioTrack({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.durationLabel,
    this.isPremium = false,
    this.asset = defaultAsset,
    this.icon = Icons.music_note_rounded,
  });

  bool get isFree => !isPremium;
}