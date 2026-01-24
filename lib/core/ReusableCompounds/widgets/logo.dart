import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            'Assets/images/blod_logo.png',
            width: 80,
            height: 80,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'LifeFlow',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
