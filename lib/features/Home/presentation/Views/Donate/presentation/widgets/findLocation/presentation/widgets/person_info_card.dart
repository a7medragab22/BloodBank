import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonInfoCard extends StatelessWidget {
  const PersonInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: .3.sh,
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
