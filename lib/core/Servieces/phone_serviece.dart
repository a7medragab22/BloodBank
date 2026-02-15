import 'package:url_launcher/url_launcher.dart';

class PhoneService {
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');

    if (!await launchUrl(phoneUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $phoneNumber');
    }
  }
}
