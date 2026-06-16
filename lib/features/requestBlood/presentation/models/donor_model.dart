class DonorModel {
  final String name;
  final String phoneNumber;
  final String age;
  final String image;
  final String bloodGroup;
  final double distance;
  final int lastDonationMonth;
  final bool available;

  DonorModel({
    required this.name,
    required this.phoneNumber,
    required this.age,
    required this.image,
    required this.bloodGroup,
    required this.distance,
    required this.lastDonationMonth,
    required this.available,
  });
}
