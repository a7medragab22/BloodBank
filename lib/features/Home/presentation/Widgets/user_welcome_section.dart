
import 'package:flutter/material.dart';

class UserWelcomeSection extends StatelessWidget {
  const UserWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('Assets/images/image.png', height: 44, width: 44),
        SizedBox(width: 8),
        Column(
          children: [
            Text(
              'Welcome,',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              'Ahmed',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
