import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialButton('Assets/images/google.png.png'),
        _socialButton('Assets/images/facebook.png.webp'),
        _socialButton('Assets/images/google.png.png'),
      ],
    );
  }

  Widget _socialButton(String asset) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F0ED), // لون الخلفية الفاتح
        borderRadius: BorderRadius.circular(20), // الزوايا الدائرية
      ),
      child: Center(child: Image.asset(asset, width: 28.w, height: 28.h)),
    );
  }
}
