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
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Regenration cycle',
                      style: TextStyle(
                        color: AppColor.kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    Image.asset(
                      'Assets/images/blod_logo.png',
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      '90 days passed',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 8.w),

            /// RIGHT SIDE
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'Assets/images/blod_logo.png',
                            width: 50.w,
                            height: 50.h,
                          ),
                          Text(
                            'Blood Type',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'Assets/images/blod_logo.png',
                            width: 50.w,
                            height: 50.h,
                          ),
                          Text(
                            'Number of donations',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
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
