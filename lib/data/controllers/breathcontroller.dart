import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/widgets/appnavigator.dart';
import '../../core/widgets/snackbar.dart';
import '../../presentation/bottomnavigation/breathsection/activebreathing.dart';
import '../../presentation/bottomnavigation/breathsection/audiosessions.dart';
import '../../presentation/bottomnavigation/breathsection/breathwidgets/audiotrack.dart';
import '../../presentation/bottomnavigation/breathsection/breathwidgets/breathorb.dart';
import '../../presentation/bottomnavigation/breathsection/breathwidgets/breathsession.dart';

/// Breath tab + uski dono sub screens (Active Breathing, Audio Sanctuary)
/// ka ek hi controller. Audio player bhi yahin hai.
///
/// Har screen mein `BreathController.to` use karein (pehli baar create karta hai,
/// baad mein wahi instance wapas deta hai).
class BreathController extends GetxController {
  static BreathController get to => Get.isRegistered<BreathController>()
      ? Get.find<BreathController>()
      : Get.put(BreathController(), permanent: true);

  // ====================================================================
  // BREATH TAB — TEXTS
  // ====================================================================
  final String headerTitle = "Just Stop And Breathe";
  final String headerSubtitle = "Take a mindful pause.";
  final String sessionsTitle = "Breathing Sessions";
  final String startButtonText = "Start Breathing Session";
  final String guidedAudioTitle = "Guided Audio";
  final String viewAudioText = "View Audio Sessions";

  // ====================================================================
  // BREATHING SESSIONS
  // ====================================================================
  final List<BreathSession> breathSessions = const [
    BreathSession(
      title: "60 Seconds",
      subtitle: "1 Minute Centering to reset",
      activeTitle: "60 Second Centering Breathe",
      pillLabel: "60-Second Centering Breath",
      totalSeconds: 60,
    ),
    BreathSession(
      title: "3 Minutes",
      subtitle: "12 deeper autonomic cycles",
      activeTitle: "3 Minute Centering Breathe",
      pillLabel: "3-Minute Centering Breath",
      totalSeconds: 180,
    ),
    BreathSession(
      title: "5 Minutes",
      subtitle: "Deep stillness to untangle stress",
      activeTitle: "5 Minute Centering Breathe",
      pillLabel: "5-Minute Centering Breath",
      totalSeconds: 300,
    ),
    BreathSession(
      title: "10 Minutes",
      subtitle: "Deep reflective stillness meditation",
      activeTitle: "10 Minute Centering Breathe",
      pillLabel: "10-Minute Centering Breath",
      totalSeconds: 600,
    ),
  ];

  /// Design mein 3 Minutes selected hai
  var selectedSession = 1.obs;

  BreathSession get currentSession => breathSessions[selectedSession.value];

  void selectSession(int index) => selectedSession.value = index;

  // ====================================================================
  // ACTIVE BREATHING — CYCLE SETUP
  // Ek cycle = Inhale 4s + Hold 4s + Exhale 7s = 15 seconds
  // (isi liye 3 minutes = 12 cycles)
  // ====================================================================
  final String activeScreenTitle = "Active Breathing";

  final List<Map<String, dynamic>> breathPhases = [
    {"name": "Inhale", "label": "Inhale Gently", "seconds": 4},
    {"name": "Hold", "label": "Hold Softly", "seconds": 4},
    {"name": "Exhale", "label": "Exhale Slowly", "seconds": 7},
  ];

  final String tipTitle = "Somatic Grounding Tip";
  final List<String> groundingTips = [
    "\u201CRelax your shoulders, soften your gaze and let your breath flow into peace.\u201D",
    "\u201CLet your jaw unclench and feel your feet resting firmly on the ground.\u201D",
    "\u201CPlace a hand on your heart and feel each breath rise and fall.\u201D",
    "\u201CRelease the tension in your forehead and let your belly stay soft.\u201D",
  ];

  // ---------------- Live session state ----------------
  var breathCycle = 1.obs;
  var breathPhase = 0.obs;
  var phaseSecondsLeft = 4.obs;
  var breathRemaining = 0.obs;
  var isSessionRunning = false.obs;
  var isSessionPaused = false.obs;
  var isSessionFinished = false.obs;

  Timer? _sessionTimer;

  int _phaseSeconds(int index) => breathPhases[index]["seconds"] as int;

  int get cycleSeconds {
    int sum = 0;
    for (final p in breathPhases) {
      sum += p["seconds"] as int;
    }
    return sum;
  }

  int get totalCycles =>
      (currentSession.totalSeconds ~/ cycleSeconds).clamp(1, 1000);

  // ---------------- Live session getters (Obx ke andar use hote hain) ----------------
  String get sessionTitle => currentSession.activeTitle;

  String get remainingClock {
    final int s = breathRemaining.value;
    final String m = (s ~/ 60).toString().padLeft(2, '0');
    final String sec = (s % 60).toString().padLeft(2, '0');
    return "$m:$sec";
  }

  String get sessionStatusText {
    if (isSessionFinished.value) {
      return "Session complete \u2022 $totalCycles cycles";
    }
    return "$remainingClock remaining \u2022 Cycle ${breathCycle.value} of $totalCycles";
  }

  String get phaseLabel {
    if (isSessionFinished.value) return "Well Done";
    return breathPhases[breathPhase.value]["label"] as String;
  }

  String get phaseSecondsText =>
      isSessionFinished.value ? "" : "${phaseSecondsLeft.value}s";

  /// Har phase ke liye alag id (progress bar isi se reset hota hai)
  String get phaseId => "${breathCycle.value}-${breathPhase.value}";

  /// Current phase ka progress (0.0 - 1.0)
  double get phaseProgress {
    if (isSessionFinished.value) return 1.0;
    final int total = _phaseSeconds(breathPhase.value);
    final int elapsed = total - phaseSecondsLeft.value;
    final bool ticking = isSessionRunning.value && !isSessionPaused.value;
    return ((elapsed + (ticking ? 1 : 0)) / total).clamp(0.0, 1.0);
  }

  Duration get progressDuration => isSessionPaused.value
      ? const Duration(milliseconds: 200)
      : const Duration(seconds: 1);

  /// Inhale/Hold par circle bara, Exhale (ya finish) par chota
  double get orbScale {
    if (isSessionFinished.value) return kBreathOrbMinScale;
    final bool exhale = breathPhases[breathPhase.value]["name"] == "Exhale";
    return exhale ? kBreathOrbMinScale : 1.0;
  }

  Duration get orbDuration {
    if (isSessionFinished.value) return const Duration(milliseconds: 1500);
    return Duration(seconds: _phaseSeconds(breathPhase.value));
  }

  String get currentTip =>
      groundingTips[(breathCycle.value - 1) % groundingTips.length];

  String get sessionButtonText {
    if (isSessionFinished.value) return "Complete Session";
    return isSessionPaused.value ? "Resume Session" : "Pause Session";
  }

  IconData get sessionButtonIcon {
    if (isSessionFinished.value) return Icons.check_rounded;
    return isSessionPaused.value
        ? Icons.play_arrow_rounded
        : Icons.pause_rounded;
  }

  // ---------------- Live session actions ----------------
  /// Breath tab ka "Start Breathing Session" button
  void startSession() {
    // Session ke waqt audio band
    _player.pause();

    _sessionTimer?.cancel();
    breathCycle.value = 1;
    breathPhase.value = 0;
    phaseSecondsLeft.value = _phaseSeconds(0);
    breathRemaining.value = totalCycles * cycleSeconds;
    isSessionPaused.value = false;
    isSessionFinished.value = false;
    isSessionRunning.value = true;

    _startSessionTimer();
    AppNavigator.push(ActiveBreathingScreen());
  }

  void _startSessionTimer() {
    _sessionTimer?.cancel();
    _sessionTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => _tickSession());
  }

  void _tickSession() {
    if (breathRemaining.value > 0) breathRemaining.value--;

    if (phaseSecondsLeft.value > 1) {
      phaseSecondsLeft.value--;
      return;
    }

    // current phase khatam
    if (breathPhase.value < breathPhases.length - 1) {
      breathPhase.value++;
    } else if (breathCycle.value < totalCycles) {
      breathCycle.value++;
      breathPhase.value = 0;
    } else {
      _finishSession();
      return;
    }
    phaseSecondsLeft.value = _phaseSeconds(breathPhase.value);
    HapticFeedback.lightImpact();
  }

  void _finishSession() {
    _sessionTimer?.cancel();
    breathRemaining.value = 0;
    isSessionRunning.value = false;
    isSessionPaused.value = false;
    isSessionFinished.value = true;
    HapticFeedback.mediumImpact();
    SnackbarService.success("Beautiful. Your breathing session is complete.");
    // TODO: API - breathing session complete mark karna
  }

  /// Bottom button: Pause / Resume / Complete
  void onSessionButtonTap() {
    if (isSessionFinished.value) {
      completeSession();
      return;
    }
    if (isSessionPaused.value) {
      isSessionPaused.value = false;
      _startSessionTimer();
    } else {
      isSessionPaused.value = true;
      _sessionTimer?.cancel();
    }
  }

  /// Session khatam hone ke baad "Complete Session"
  void completeSession() => Get.back();

  /// Screen se bahar aate hi (back button ya system back) timer band
  void exitSession() {
    _sessionTimer?.cancel();
    isSessionRunning.value = false;
    isSessionPaused.value = false;
    isSessionFinished.value = false;
  }

  // ====================================================================
  // AUDIO — DATA
  // ====================================================================
  final String audioScreenTitle = "Audio Sanctuary";
  final String featuredLabel = "Free Daily Sanctuary";
  final String featuredDescription =
      "Free includes up to 3 saved reflections. Premium unlocks unlimited journal entries, full reflection history, and audio voice archives.";
  final String teachingsTitle = "Key Teachings & Reflections";
  final String meditationsTitle = "Guided Meditations";

  /// Breath tab ka "Guided Audio" section
  final List<AudioTrack> guidedAudios = const [
    AudioTrack(
      id: "guided_bells",
      title: "Morning Sanctuary Bells",
      subtitle: "Free Audio Preview",
      durationLabel: "7 min",
      icon: Icons.play_arrow_rounded,
    ),
    AudioTrack(
      id: "guided_ocean",
      title: "Restorative Ocean Breath",
      subtitle: "Key Member Pass",
      durationLabel: "12 min",
      isPremium: true,
      icon: Icons.music_note_rounded,
    ),
    AudioTrack(
      id: "guided_evening",
      title: "Evening Release",
      subtitle: "Key Member Pass",
      durationLabel: "15 min",
      isPremium: true,
      icon: Icons.nightlight_round,
    ),
  ];

  /// Audio Sanctuary — Key Teachings & Reflections
  /// TODO: API se aayega. Abhi sab tracks `naat.mp3` chalate hain.
  final List<AudioTrack> keyTeachings = const [
    AudioTrack(
      id: "key_1",
      title: "Key 1: Admit Your Powerlessness",
      subtitle: "Core contemplation",
      durationLabel: "4:30",
    ),
    AudioTrack(
      id: "key_2",
      title: "Key 2: Embrace a Higher Power",
      subtitle: "Deep reflective discourse",
      durationLabel: "5:10",
      isPremium: true,
    ),
    AudioTrack(
      id: "key_3",
      title: "Key 3: Gratitude in Small Things",
      subtitle: "Deep reflective discourse",
      durationLabel: "4:45",
      isPremium: true,
    ),
    AudioTrack(
      id: "key_4",
      title: "Key 4: Embrace Daily Surrender",
      subtitle: "Deep reflective discourse",
      durationLabel: "6:00",
      isPremium: true,
    ),
  ];

  /// Audio Sanctuary — Guided Meditations
  final List<AudioTrack> guidedMeditations = const [
    AudioTrack(
      id: "med_morning",
      title: "Morning Light Contemplation",
      subtitle: "Dawn Invocations",
      durationLabel: "6:00",
    ),
    AudioTrack(
      id: "med_evening",
      title: "Evening Reflections",
      subtitle: "Releasing the day",
      durationLabel: "8:30",
      isPremium: true,
    ),
    AudioTrack(
      id: "med_night",
      title: "Night Stillness",
      subtitle: "Drifting into rest",
      durationLabel: "10:00",
      isPremium: true,
    ),
  ];

  /// "Free Daily Sanctuary" card isi track ko chalata hai
  AudioTrack get featuredTrack => keyTeachings.first;

  // ====================================================================
  // AUDIO — PLAYER STATE
  // ====================================================================
  final AudioPlayer _player = AudioPlayer();

  final Rxn<AudioTrack> currentTrack = Rxn<AudioTrack>();
  var isPlaying = false.obs;
  var isAudioLoading = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;

  StreamSubscription<PlayerState>? _stateSub;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;

  @override
  void onInit() {
    super.onInit();

    _stateSub = _player.playerStateStream.listen((PlayerState state) {
      final bool completed = state.processingState == ProcessingState.completed;
      isPlaying.value = state.playing && !completed;
      if (completed) _onTrackCompleted();
    });

    _positionSub = _player.positionStream.listen((Duration p) {
      position.value = p;
    });

    _durationSub = _player.durationStream.listen((Duration? d) {
      if (d != null) duration.value = d;
    });
  }

  /// Track khatam hone par wapas shuru par le jao (paused)
  Future<void> _onTrackCompleted() async {
    await _player.pause();
    await _player.seek(Duration.zero);
    position.value = Duration.zero;
  }

  // ---------------- Audio getters (Obx ke andar use hote hain) ----------------
  bool isCurrent(AudioTrack track) => currentTrack.value?.id == track.id;

  bool isPlayingTrack(AudioTrack track) =>
      isCurrent(track) && isPlaying.value;

  bool isLoadingTrack(AudioTrack track) =>
      isCurrent(track) && isAudioLoading.value;

  double get audioProgress {
    final int total = duration.value.inMilliseconds;
    if (total <= 0) return 0.0;
    return (position.value.inMilliseconds / total).clamp(0.0, 1.0);
  }

  String get positionText => _formatTime(position.value);

  String get durationText => _formatTime(duration.value);

  String trackTimeText(AudioTrack track) => isCurrent(track)
      ? "$positionText / $durationText"
      : "0:00 / ${track.durationLabel}";

  String trackStatusText(AudioTrack track) {
    if (!isCurrent(track)) return "Tap play to listen";
    if (isAudioLoading.value) return "Preparing audio...";
    return isPlaying.value ? "Listening in progress" : "Paused";
  }

  String _formatTime(Duration d) {
    final int minutes = d.inMinutes;
    final String seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  // ---------------- Audio actions ----------------
  /// Kisi bhi track ka play/pause button
  Future<void> playTrack(AudioTrack track) async {
    if (track.isPremium) {
      SnackbarService.info("${track.title} is part of the Key Member Pass.");
      // TODO: subscription screen kholni hai
      return;
    }

    // Wohi track hai to sirf play/pause
    if (isCurrent(track)) {
      await togglePlayPause();
      return;
    }

    try {
      currentTrack.value = track;
      position.value = Duration.zero;
      duration.value = Duration.zero;
      isAudioLoading.value = true;

      final Duration? loaded = await _player.setAsset(track.asset);
      if (loaded != null) duration.value = loaded;

      // NOTE: play() ka future track khatam hone par complete hota hai,
      // isliye await nahi kiya.
      _player.play();
    } catch (e) {
      debugPrint("Audio error: $e");
      currentTrack.value = null;
      SnackbarService.error(await _diagnoseAsset(track.asset));
    } finally {
      isAudioLoading.value = false;
    }
  }

  /// Audio na chale to asli wajah batata hai (file missing / khaali / audio hi nahi).
  Future<String> _diagnoseAsset(String asset) async {
    final String name = asset.split('/').last;

    try {
      final ByteData data = await rootBundle.load(asset);
      final int size = data.lengthInBytes;
      debugPrint("Audio asset $asset size: $size bytes");

      if (size < 2048) {
        return "$name is empty or too small ($size bytes). Please add a real MP3 file.";
      }

      final int b0 = data.getUint8(0);
      final int b1 = data.getUint8(1);
      final int b2 = data.getUint8(2);
      final int b3 = data.getUint8(3);

      // Web page (HTML) ko mp3 naam de kar save kiya gaya ho
      if (b0 == 0x3C) {
        return "$name is a web page, not audio. Please download the real MP3 file.";
      }

      final bool isMp3 = (b0 == 0x49 && b1 == 0x44 && b2 == 0x33) || // ID3
          (b0 == 0xFF && (b1 & 0xE0) == 0xE0); // MP3/ADTS frame
      final bool isOgg = b0 == 0x4F && b1 == 0x67 && b2 == 0x67 && b3 == 0x53;
      final bool isWav = b0 == 0x52 && b1 == 0x49 && b2 == 0x46 && b3 == 0x46;
      final bool isFlac = b0 == 0x66 && b1 == 0x4C && b2 == 0x61 && b3 == 0x43;
      final bool isMp4 = size > 8 &&
          data.getUint8(4) == 0x66 &&
          data.getUint8(5) == 0x74 &&
          data.getUint8(6) == 0x79 &&
          data.getUint8(7) == 0x70; // "ftyp"

      if (!(isMp3 || isOgg || isWav || isFlac || isMp4)) {
        return "$name is not a valid audio file. Please re-export it as MP3.";
      }

      return "$name could not be decoded on this device. Please re-export it as MP3.";
    } catch (_) {
      // Asset load nahi hua: dekhte hain app ke bundle mein kya kya hai
      bool listed = false;
      List<String> found = [];
      try {
        final AssetManifest manifest =
        await AssetManifest.loadFromAssetBundle(rootBundle);
        final List<String> all = manifest.listAssets();
        found = all.where((a) => a.startsWith('assets/audio/')).toList();
        listed = all.contains(asset);
      } catch (_) {}

      debugPrint("Audio files inside the app bundle: $found");

      if (listed) {
        // Bundle mein naam hai magar data nahi => file 0 bytes hai
        return "$name is in the app but has no data (0 bytes). Please replace it with a real MP3.";
      }

      final String have =
      found.isEmpty ? "none" : found.map((a) => a.split('/').last).join(', ');
      return "$name is not inside the app. Audio files found: $have. Stop the app and run it again (not hot restart).";
    }
  }

  Future<void> togglePlayPause() async {
    if (currentTrack.value == null) return;

    if (_player.playing) {
      await _player.pause();
    } else {
      if (_player.processingState == ProcessingState.completed) {
        await _player.seek(Duration.zero);
      }
      _player.play();
    }
  }

  /// Progress bar par tap/drag (0.0 - 1.0)
  void seekToFraction(double fraction) {
    final int total = duration.value.inMilliseconds;
    if (currentTrack.value == null || total <= 0) return;

    final Duration target =
    Duration(milliseconds: (total * fraction.clamp(0.0, 1.0)).round());
    position.value = target;
    _player.seek(target);
  }

  /// Replay 10 / Forward 10 buttons
  void skipBy(Duration delta) {
    final int total = duration.value.inMilliseconds;
    if (currentTrack.value == null || total <= 0) return;

    final int target =
    (position.value.inMilliseconds + delta.inMilliseconds).clamp(0, total);
    position.value = Duration(milliseconds: target);
    _player.seek(Duration(milliseconds: target));
  }

  // ====================================================================
  // NAVIGATION
  // ====================================================================
  /// "View Audio Sessions" link
  void viewAudioSessions() => AppNavigator.push(AudioSessionsScreen());

  @override
  void onClose() {
    _sessionTimer?.cancel();
    _stateSub?.cancel();
    _positionSub?.cancel();
    _durationSub?.cancel();
    _player.dispose();
    super.onClose();
  }
}