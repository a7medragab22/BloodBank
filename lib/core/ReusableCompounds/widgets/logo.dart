import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            'Assets/images/blod_logo.png',
            width: 80.w,
            height: 80.h,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'LifeFlow',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
