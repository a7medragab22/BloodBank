class HistoryModel {
  final String id;

  /// 'Donor' or 'Recipient'
  final String role;
  final String status;
  String dateTime;
  final String hospitalName;
  final String hospitalLocation;
  final String? points;

  /// true for points earned (donor), false for points used (recipient)
  final bool isPointsEarned;

  /// true if not completed yet
  final bool isScheduled;

  HistoryModel({
    required this.id,
    required this.role,
    required this.status,
    required this.dateTime,
    required this.hospitalName,
    required this.hospitalLocation,
    this.points,
    this.isPointsEarned = true,
    required this.isScheduled,
  });
}
