import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/History/data/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.historyModel});

  final HistoryModel historyModel;

  Color _getRoleColor() {
    if (historyModel.role == 'Donor') {
      return const Color(0xFF10B981);
    } else {
      return const Color(0xFF3B82F6);
    }
  }

  Color _getRoleBackgroundColor() {
    if (historyModel.role == 'Donor') {
      return const Color(0xFFD1FAE5);
    } else {
      return const Color(0xFFDEEBFF);
    }
  }

  Color _getStatusColor() {
    if (historyModel.status == 'Completed') {
      return const Color(0xFF10B981);
    } else {
      return const Color(0xFF3B82F6);
    }
  }

  Color _getStatusBackgroundColor() {
    if (historyModel.status == 'Completed') {
      return const Color(0xFFF0FDF4);
    } else {
      return const Color(0xFFEFF6FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Role Badge and Status Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Role Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _getRoleBackgroundColor(),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  historyModel.role,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: _getRoleColor(),
                  ),
                ),
              ),
              // Status Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _getStatusBackgroundColor(),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  historyModel.status,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          // DateTime with icon
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16.sp,
                color: const Color(0xFF9CA3AF),
              ),
              SizedBox(width: 8.w),
              Text(
                historyModel.dateTime,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4B5563),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Hospital Name with icon
          Row(
            children: [
              Icon(
                Icons.local_hospital_outlined,
                size: 16.sp,
                color: const Color(0xFF9CA3AF),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  historyModel.hospitalName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4B5563),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Hospital Location with icon
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.sp,
                color: const Color(0xFF9CA3AF),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  historyModel.hospitalLocation,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4B5563),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          // Points section (only show if completed and points available)
          if (!historyModel.isScheduled && historyModel.points != null) ...[
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  size: 16.sp,
                  color: AppColor.kSecondaryColor,
                ),
                SizedBox(width: 8.w),
                Text(
                  historyModel.isPointsEarned
                      ? '+${historyModel.points} Points Earned'
                      : '-${historyModel.points} Points Used',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: historyModel.isPointsEarned
                        ? const Color(0xFF10B981)
                        : const Color(0xFF3B82F6),
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
