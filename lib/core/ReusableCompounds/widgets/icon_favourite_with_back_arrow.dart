import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class IconFAvouriteWithBackArrow extends StatelessWidget {
  const IconFAvouriteWithBackArrow({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Icon(icon, color: AppColor.kPrimaryColor, size: 28),
    );
  }
}
