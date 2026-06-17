import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlodActionSection extends StatelessWidget {
  const BlodActionSection({
    super.key,
    required this.name,
    required this.imagePath,
    required this.onTap,
  });
  final String name;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isRequest = name.toLowerCase().contains('request');
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180.h,
        width: 154.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isRequest ? AppColor.kSecondaryColor : Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon Container
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: isRequest 
                    ? Colors.white.withOpacity(0.2) 
                    : const Color(0xFFFFECEF),
                borderRadius: BorderRadius.circular(16.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                isRequest ? Icons.water_drop : Icons.water_drop_outlined,
                color: isRequest ? Colors.white : AppColor.kSecondaryColor,
                size: 24.sp,
              ),
            ),
            
            // Text and Arrow Row
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isRequest ? Colors.white : Colors.black87,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        isRequest ? 'Find donors nearby' : 'Save a life today',
                        style: TextStyle(
                          color: isRequest 
                              ? Colors.white.withOpacity(0.8) 
                              : Colors.grey[600],
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: isRequest ? Colors.white : Colors.black54,
                      size: 14.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}