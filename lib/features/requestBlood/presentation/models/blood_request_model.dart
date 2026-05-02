class BloodRequestModel {
  final String patientName;
  final String bloodType;
  final int unitsNeeded;
  final String urgencyLevel;
  final String location;
  final String contactPhone;
  final String description;

  BloodRequestModel({
    required this.patientName,
    required this.bloodType,
    required this.unitsNeeded,
    required this.urgencyLevel,
    required this.location,
    required this.contactPhone,
    required this.description,
  });
}
