
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: AppColor.kSecondaryColor,
          size: 16.sp,
        ),
        SizedBox(width: 4.w),
        Text(
          'Riyadh, Saudi Arabia',
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}