import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/requestBlood/presentation/models/blood_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonInfoCard extends StatelessWidget {
  final BloodRequestModel request;
  const PersonInfoCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: .9.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.kSecondaryColor,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Patient: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          request.patientName,
                          style: TextStyle(fontSize: 12.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: request.urgencyLevel.toLowerCase() == 'critical'
                        ? AppColor.kPrimaryColor
                        : Colors.orange,
                  ),
                  child: Text(
                    request.urgencyLevel,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  Icons.bloodtype_outlined,
                  color: AppColor.kSecondaryColor,
                  size: 20.sp,
                ),
                SizedBox(width: 4.w),
                Text('${request.bloodType}  |  ',
                    style: const TextStyle(color: Colors.grey)),
                Text('${request.unitsNeeded} Units',
                    style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                const Icon(Icons.timer_outlined, color: Colors.grey, size: 18),
                SizedBox(width: 4.w),
                const Text('Just now', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              request.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13.sp, color: Colors.black87),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 18.sp,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    request.location,
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kPrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'I Can Help',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Icon(Icons.call, color: Colors.black, size: 18.sp),
                    ),
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