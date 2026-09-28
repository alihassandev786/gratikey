/// Ek breathing session ka data (60 Seconds / 3 Minutes / 5 Minutes / 10 Minutes).
class BreathSession {
  /// Breath tab ki list mein title, misal "3 Minutes"
  final String title;

  /// Breath tab ki list mein subtitle
  final String subtitle;

  /// Active Breathing screen ka bara title
  final String activeTitle;

  /// Breath tab ke circle ke neeche wali pill ka text
  final String pillLabel;

  /// Poore session ka waqt (seconds mein)
  final int totalSeconds;

  const BreathSession({
    required this.title,
    required this.subtitle,
    required this.activeTitle,
    required this.pillLabel,
    required this.totalSeconds,
  });
}