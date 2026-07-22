import 'package:blodbank/features/Notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationModel {
  final String title;
  final String time;
  final NotificationType type;
  final String bloodType;
  final bool isRead;
  final DateTime dateTime;

  NotificationModel({
    required this.title,
    required this.time,
    required this.type,
    required this.bloodType,
    this.isRead = false,
    required this.dateTime,
  });
}

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  List<NotificationModel> _getSampleNotifications() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final twoDaysAgo = now.subtract(const Duration(days: 2));
    final weekAgo = now.subtract(const Duration(days: 7));

    return [
      // Today
      NotificationModel(
        title: 'New patient request (A+) needs blood donation nearby.',
        time: 'Just now',
        type: NotificationType.newPatientRequest,
        bloodType: 'A+',
        isRead: false,
        dateTime: now,
      ),
      NotificationModel(
        title: 'New donor available (O-) matching current requests.',
        time: '2 minutes ago',
        type: NotificationType.newDonorAvailable,
        bloodType: 'O-',
        isRead: false,
        dateTime: now.subtract(const Duration(minutes: 2)),
      ),
      NotificationModel(
        title: 'Your donation request has been approved.',
        time: '15 minutes ago',
        type: NotificationType.donorRequestApproved,
        bloodType: 'B+',
        isRead: false,
        dateTime: now.subtract(const Duration(minutes: 15)),
      ),
      // Yesterday
      NotificationModel(
        title: 'Your blood request has been approved and help is on the way.',
        time: '3 hours ago',
        type: NotificationType.patientAssistanceApproved,
        bloodType: 'AB-',
        isRead: true,
        dateTime: yesterday,
      ),
      NotificationModel(
        title: 'New patient request (B+) needs blood donation nearby.',
        time: 'Yesterday',
        type: NotificationType.newPatientRequest,
        bloodType: 'B+',
        isRead: true,
        dateTime: yesterday.subtract(const Duration(hours: 4)),
      ),
      // Earlier
      NotificationModel(
        title: 'New donor available (A+) matching current requests.',
        time: '2 days ago',
        type: NotificationType.newDonorAvailable,
        bloodType: 'A+',
        isRead: true,
        dateTime: twoDaysAgo,
      ),
      NotificationModel(
        title: 'Your donation request has been approved.',
        time: '7 days ago',
        type: NotificationType.donorRequestApproved,
        bloodType: 'O+',
        isRead: true,
        dateTime: weekAgo,
      ),
      NotificationModel(
        title: 'New patient request (O-) needs blood donation nearby.',
        time: '7 days ago',
        type: NotificationType.newPatientRequest,
        bloodType: 'O-',
        isRead: true,
        dateTime: weekAgo.subtract(const Duration(hours: 2)),
      ),
    ];
  }

  Map<String, List<NotificationModel>> _groupNotificationsByDate(
    List<NotificationModel> notifications,
  ) {
    final grouped = <String, List<NotificationModel>>{};
    final now = DateTime.now();

    for (var notification in notifications) {
      String groupKey;

      if (_isToday(notification.dateTime, now)) {
        groupKey = 'Today';
      } else if (_isYesterday(notification.dateTime, now)) {
        groupKey = 'Yesterday';
      } else {
        groupKey = 'Earlier';
      }

      grouped.putIfAbsent(groupKey, () => []).add(notification);
    }

    return grouped;
  }

  bool _isToday(DateTime date, DateTime now) {
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isYesterday(DateTime date, DateTime now) {
    final yesterday = now.subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  @override
  Widget build(BuildContext context) {
    final notifications = _getSampleNotifications();
    final groupedNotifications = _groupNotificationsByDate(notifications);
    final groupOrder = ['Today', 'Yesterday', 'Earlier'];
    final sortedGroups = groupOrder
        .where((key) => groupedNotifications.containsKey(key))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xFF1F2937),
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: const Color(0xFF1F2937),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Mark all as read or filter functionality
            },
            icon: const Icon(Icons.more_vert, color: Color(0xFF1F2937)),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: groupedNotifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount:
                  sortedGroups.length * 2 -
                  1, // Accounts for section headers and separators
              itemBuilder: (context, index) {
                // Calculate which group and item we're rendering
                int groupIndex = 0;
                int itemsBeforeThisGroup = 0;

                for (int i = 0; i < sortedGroups.length; i++) {
                  int groupSize = groupedNotifications[sortedGroups[i]]!.length;
                  int itemsForThisGroup = groupSize + 1; // +1 for header

                  if (itemsBeforeThisGroup + itemsForThisGroup > index) {
                    groupIndex = i;
                    break;
                  }

                  itemsBeforeThisGroup += itemsForThisGroup;
                }

                final currentGroupKey = sortedGroups[groupIndex];
                final itemIndexInGroup = index - itemsBeforeThisGroup;

                // Render header
                if (itemIndexInGroup == 0) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 12.h, 0, 12.h),
                    child: Text(
                      currentGroupKey,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF6B7280),
                        letterSpacing: 0.5,
                      ),
                    ),
                  );
                }

                // Render notification item
                final notificationIndex = itemIndexInGroup - 1;
                final notification =
                    groupedNotifications[currentGroupKey]![notificationIndex];

                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: NotificationItem(
                    title: notification.title,
                    time: notification.time,
                    notificationType: notification.type,
                    bloodType: notification.bloodType,
                    isRead: notification.isRead,
                    onTap: () {
                      // Handle notification tap
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(notification.title),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 64.w,
            color: const Color(0xFFD1D5DB),
          ),
          SizedBox(height: 16.h),
          Text(
            'No Notifications',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6B7280),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'You\'re all caught up!',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
