import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToEarnPoints extends StatelessWidget {
  const HowToEarnPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFD0E3FF), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to Earn Points',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D3142),
            ),
          ),
          SizedBox(height: 16.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 3.5,
            children: [
              _buildEarnItem('Whole Blood', '100 pts'),
              _buildEarnItem('Platelets', '150 pts'),
              _buildEarnItem('Plasma', '125 pts'),
              _buildEarnItem('Red Cells', '130 pts'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarnItem(String type, String pts) {
    return Row(
      children: [
        Icon(Icons.favorite_border, color: Colors.blue, size: 18.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            '$type: $pts',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF4B4F5A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}