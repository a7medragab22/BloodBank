
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWelcomeSection extends StatelessWidget {
  const UserWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('Assets/images/image.png', height: 44.h, width: 44.w),
        SizedBox(width: 8.w),
        Column(
          children: [
            Text(
              'Welcome,',
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            Text(
              'Ahmed',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
