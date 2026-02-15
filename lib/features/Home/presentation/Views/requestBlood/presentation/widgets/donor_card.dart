import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/cubits/donorCubit/donor_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/models/donor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonorCard extends StatelessWidget {
  final DonorModel donor;

  const DonorCard({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  donor.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                StatusChip(text: "Available", color: Colors.green.shade100),
              ],
            ),

            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  Icons.favorite_outline,
                  size: 18.sp,
                  color: AppColor.kPrimaryColor,
                ),
                SizedBox(width: 4.w),
                Text(donor.bloodGroup, style: TextStyle(color: Colors.grey)),
                SizedBox(width: 16.w),
                Icon(Icons.person_outline, size: 18.sp, color: Colors.grey),
                SizedBox(width: 4.w),
                Text(donor.age, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18.sp,
                  color: Colors.grey,
                ),
                SizedBox(width: 4.w),
                Text(
                  "${donor.distance} miles away",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 18.sp,
                  color: Colors.grey,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Row(
                    children: [
                      Text('Last donation: '),
                      Text(
                        "${donor.lastDonationMonth} months ago",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kPrimaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: Size(.4.sw, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: () {
                    context.read<DonorCubit>().callDonor(donor.phoneNumber);
                  },

                  child: Row(
                    children: [
                      Icon(Icons.phone_outlined, size: 18.sp),
                      SizedBox(width: 6.w),
                      Text('contact'),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: Size(.2.sw, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),

                  onPressed: () {},

                  child: Row(children: [Text('message')]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String text;
  final Color color;

  const StatusChip({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.green.shade900, fontSize: 12),
      ),
    );
  }
}
