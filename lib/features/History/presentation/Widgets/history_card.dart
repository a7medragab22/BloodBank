import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.type,
    required this.details,
    required this.dateTime,
    required this.hospital,
    this.pointsEarned,
    required this.status,
    required this.isScheduled,
    this.onReschedule,
    this.onCancel,
    this.onDelete,
  });

  final String type;
  final String details;
  final String dateTime;
  final String hospital;
  final String? pointsEarned;
  final String status;
  final bool isScheduled;
  final VoidCallback? onReschedule;
  final VoidCallback? onCancel;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isScheduled ? Icons.access_time : Icons.check_circle_outline,
                color: isScheduled
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFF22C55E),
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3142),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isScheduled
                      ? const Color(0xFFEFF6FF)
                      : const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isScheduled
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF22C55E),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.withValues(alpha: 0.6),
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF64748B),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16.sp,
                      color: const Color(0xFF9EA3AE),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      dateTime,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF4B4F5A),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16.sp,
                      color: const Color(0xFF9EA3AE),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      hospital,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF4B4F5A),
                      ),
                    ),
                  ],
                ),
                if (pointsEarned != null) ...[
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 16.sp,
                        color: const Color(0xFF9EA3AE),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        pointsEarned!,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xFF4B4F5A),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (isScheduled) ...[
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onReschedule,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      'Reschedule',
                      style: TextStyle(
                        color: const Color(0xFF4B4F5A),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColor.kSecondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
