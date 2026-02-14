import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestBlodView extends StatelessWidget {
  const RequestBlodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(title: Text('Blood Request')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.black.withValues(alpha: .88),
                    ),
                    child: Center(
                      child: Text(
                        '🔍    Find Donors',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kSecondaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '+    New Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              BloodRequestCard(),
              SizedBox(height: 16.h),
              BloodRequestCard(),
              SizedBox(height: 16.h),
              BloodRequestCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  const BloodRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: .36.sh,
      width: .9.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),

      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      'Patient: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'Ahmed Mohsen bew bew',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
                Container(
                  height: 28.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.kPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Critical',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColor.kSecondaryColor,
                    size: 20.sp,
                  ),
                ),
                Text('A+  |  ', style: TextStyle(color: Colors.grey)),
                Text('3 Unites', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 16.w),
                Icon(Icons.timer_outlined, color: Colors.grey, size: 20.sp),
                SizedBox(width: 4.w),
                Text('14 days ago', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Text(
              'Patient requires urgent blood transfusion due to surgery.',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 20.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  'City genral hospital',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.timer_outlined, color: Colors.grey, size: 20.sp),
                SizedBox(width: 4.w),
                Text(
                  'Needed by: 20 Aug, 2025',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.people, color: Colors.grey, size: 20.sp),
                SizedBox(width: 4.w),
                Text(
                  '8 donors responded',
                  style: TextStyle(color: Colors.grey),
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
                            fontSize: 16.sp,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.call, color: Colors.black, size: 18.sp),
                        SizedBox(width: 4.w),
                        Text(
                          'Call',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
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
