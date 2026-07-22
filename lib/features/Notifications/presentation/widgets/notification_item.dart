import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum NotificationType {
  newPatientRequest,
  newDonorAvailable,
  donorRequestApproved,
  patientAssistanceApproved,
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.time,
    required this.notificationType,
    required this.bloodType,
    this.isRead = false,
    this.onTap,
  });

  final String title;
  final String time;
  final NotificationType notificationType;
  final String bloodType;
  final bool isRead;
  final VoidCallback? onTap;

  Color _getAccentColor() {
    switch (notificationType) {
      case NotificationType.newPatientRequest:
        return const Color(0xFFEF4444); // Red
      case NotificationType.newDonorAvailable:
        return const Color(0xFF3B82F6); // Blue
      case NotificationType.donorRequestApproved:
        return const Color(0xFF10B981); // Green
      case NotificationType.patientAssistanceApproved:
        return const Color(0xFF14B8A6); // Teal
    }
  }

  Color _getBackgroundColor() {
    final accentColor = _getAccentColor();
    return accentColor.withValues(alpha: 0.08);
  }

  IconData _getIcon() {
    switch (notificationType) {
      case NotificationType.newPatientRequest:
        return Icons.emergency;
      case NotificationType.newDonorAvailable:
        return Icons.favorite;
      case NotificationType.donorRequestApproved:
        return Icons.check_circle;
      case NotificationType.patientAssistanceApproved:
        return Icons.handshake;
    }
  }

  @override
  Widget build(BuildContext context) {
    const cardPadding = 16.0;
    const cardRadius = 16.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cardRadius),
          border: !isRead
              ? Border.all(
                  color: _getAccentColor().withValues(alpha: 0.3),
                  width: 1.5,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container with Stack to support top-right unread dot
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    color: _getBackgroundColor(),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Icon(_getIcon(), color: _getAccentColor(), size: 28.w),
                  ),
                ),
                if (!isRead)
                  Positioned(
                    top: -3.h,
                    right: -3.w,
                    child: Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _getAccentColor(),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 14.w),

            // Content Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 6.h),

                  // Blood Type Badge
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: _getAccentColor().withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Blood Type: $bloodType',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: _getAccentColor(),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Time
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),

            // Menu Icon
            Icon(
              Icons.more_vert,
              color: const Color(0xFFD1D5DB),
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
