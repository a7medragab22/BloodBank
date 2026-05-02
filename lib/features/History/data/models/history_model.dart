class HistoryModel {
  final String id;
  final String type;
  final String details;
  String dateTime;
  final String hospital;
  final String? pointsEarned;
  final String status;
  final bool isScheduled;

  HistoryModel({
    required this.id,
    required this.type,
    required this.details,
    required this.dateTime,
    required this.hospital,
    this.pointsEarned,
    required this.status,
    required this.isScheduled,
  });
}
