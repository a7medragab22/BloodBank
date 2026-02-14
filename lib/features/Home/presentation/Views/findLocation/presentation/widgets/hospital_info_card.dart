import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/Home/presentation/Views/findLocation/presentation/model/find_hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HospitalInfoCard extends StatelessWidget {
  const HospitalInfoCard({super.key, required this.model});
  final FindHospitalModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.name, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_sharp, size: 20.sp, color: Colors.grey),
                Text(model.address, style: TextStyle(color: Colors.grey)),
              ],
            ),

            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.directions_walk, color: Colors.grey, size: 20.sp),
                Text(
                  '${model.distance} miles',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 16.w),
                Icon(Icons.star_border, color: Colors.yellow, size: 20.sp),
                Text(
                  model.rating.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 16.w),
                Icon(Icons.access_time, size: 20.sp, color: Colors.grey),

                Text(model.time, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey, size: 20.sp),
                SizedBox(width: 4.w),
                Text(
                  model.availability,
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                Spacer(flex: 1),

                Icon(Icons.phone, color: Colors.grey, size: 20.sp),
                SizedBox(width: 4.w),

                Text(
                  model.phone,
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    iconColor: Colors.black,
                    minimumSize: Size(.38.sw, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text(
                    'Call',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Spacer(flex: 1),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: AppColor.kSecondaryColor,
                    minimumSize: Size(.38.sw, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide.none,
                  ),

                  onPressed: () {},

                  icon: const Icon(Icons.navigation_outlined),
                  label: const Text(
                    'Directions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
