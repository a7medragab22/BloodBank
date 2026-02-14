
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: AppColor.kPrimaryColor),
        SizedBox(width: 4.w),
        Text('Cairo, Egypt', style: TextStyle(fontSize: 16.sp)),
      ],
    );
  }
}
