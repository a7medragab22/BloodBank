import 'package:blodbank/features/History/data/models/history_model.dart';
import 'package:blodbank/features/History/presentation/Widgets/history_card.dart';
import 'package:blodbank/features/History/presentation/Widgets/history_stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<HistoryModel> historyList = [
    HistoryModel(
      id: '1',
      role: 'Donor',
      status: 'Scheduled',
      dateTime: '15 Aug 2024 - 11:00 AM',
      hospitalName: "Children's Hospital",
      hospitalLocation: 'Cairo, Egypt',
      isScheduled: true,
    ),
    HistoryModel(
      id: '2',
      role: 'Recipient',
      status: 'Completed',
      dateTime: '20 Feb 2024 - 2:00 PM',
      hospitalName: "St. Mary's Medical Center",
      hospitalLocation: 'Nasr City, Cairo',
      points: '100',
      isPointsEarned: false,
      isScheduled: false,
    ),
    HistoryModel(
      id: '3',
      role: 'Donor',
      status: 'Completed',
      dateTime: '15 Jan 2024 - 10:00 AM',
      hospitalName: "City General Hospital",
      hospitalLocation: 'Giza, Egypt',
      points: '150',
      isPointsEarned: true,
      isScheduled: false,
    ),
  ];

  int _getCompletedCount() {
    return historyList.where((item) => item.status == 'Completed').length;
  }

  int _getTotalPoints() {
    int total = 0;
    for (var item in historyList) {
      if (item.points != null) {
        final points = int.tryParse(item.points!) ?? 0;
        if (item.isPointsEarned) {
          total += points;
        } else {
          total -= points;
        }
      }
    }
    return total;
  }

  int _getUpcomingCount() {
    return historyList.where((item) => item.isScheduled).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity History',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1F2937),
              ),
            ),
            SizedBox(height: 20.h),
            HistoryStatsSection(
              completedCases: _getCompletedCount(),
              totalPoints: _getTotalPoints(),
              upcomingCases: _getUpcomingCount(),
            ),
            SizedBox(height: 24.h),
            if (historyList.isEmpty)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Column(
                    children: [
                      Icon(
                        Icons.history,
                        size: 64.sp,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'No Activity Yet',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Your activities will appear here',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Column(
                children: [
                  ...historyList.map(
                    (item) =>
                        HistoryCard(key: ValueKey(item.id), historyModel: item),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
