import 'package:blodbank/features/Donate/presentation/views/donate_view.dart';
import 'package:blodbank/features/Home/presentation/Widgets/blod_action_section.dart';
import 'package:blodbank/features/Home/presentation/Widgets/donor_info_card.dart';
import 'package:blodbank/features/Home/presentation/Widgets/user_location_section.dart';
import 'package:blodbank/features/Home/presentation/Widgets/user_welcome_section.dart';
import 'package:blodbank/features/requestBlod/presentation/views/request_blod_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [UserWelcomeSection(), UserLocation()],
            ),

            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                BlodActionSection(
                  name: 'Request Blood',
                  imagePath: 'Assets/images/request.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(RequestBlodView.id);
                  },
                ),
                BlodActionSection(
                  name: 'Donate Blood',
                  imagePath: 'Assets/images/donate.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(DonateView.id);
                  },
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'Assets/images/together.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
            ),
            SizedBox(height: 16),
            DonorInfoCard(),
          ],
        ),
      ),
    );
  }
}
