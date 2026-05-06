import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonorInfoCard extends StatelessWidget {
  const DonorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: const Color(0xffD7D6D6),
        ),
        child: Row(
          children: [
            /// LEFT CARD
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutesName.uploadReportView);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: AppColor.kSecondaryColor,
                        size: 40.sp,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Upload Tests',
                        style: TextStyle(
                          color: AppColor.kSecondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Medical Reports',
                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 8.w),

            /// RIGHT SIDE
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox.shrink(), // Placeholder for future content
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.hospitals);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_hospital_outlined,
                              color: AppColor.kSecondaryColor,
                              size: 30.sp,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Hospitals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// class DonorInfoCard extends StatelessWidget {
//   const DonorInfoCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Color.fromARGB(255, 215, 214, 214),
//         ),
//         child: Row(
//           children: [
//             Container(
             
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.white,
//               ),
//               padding: EdgeInsets.only(top: 8, bottom: 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Regenration cycle',
//                     style: TextStyle(
//                       color: AppColor.kSecondaryColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Image.asset(
//                     'Assets/images/blod_logo.png',
//                     width: 120.w,
//                     height: 100.h,
//                     fit: BoxFit.contain,
//                   ),
//                   Text(
//                     '90 days passed',
//                     style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(flex: 1),
//             Column(
//               children: [
//                 Container(
//                   width: .4.sw,
//                   height: .14.sh,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     color: Colors.white,
//                   ),
//                   padding: EdgeInsets.only(top: 8, bottom: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         'Assets/images/blod_logo.png',
//                         width: 60.w,
//                         height: 60.h,
//                       ),
//                       Text(
//                         'Blood Type',
//                         style: TextStyle(color: Colors.grey, fontSize: 14.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Spacer(flex: 1),
//                 Container(
//                   width: .4.sw,
//                   height: .14.sh,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     color: Colors.white,
//                   ),
//                   padding: EdgeInsets.only(top: 8, bottom: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         'Assets/images/blod_logo.png',
//                         width: 60.w,
//                         height: 60.h,
//                       ),
//                       Text(
//                         'Number of donations',
//                         style: TextStyle(color: Colors.grey, fontSize: 12.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
