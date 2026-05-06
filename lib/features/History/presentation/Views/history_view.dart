import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/History/data/models/history_model.dart';
import 'package:blodbank/features/History/presentation/Widgets/history_card.dart';
import 'package:blodbank/features/History/presentation/Widgets/history_stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<HistoryModel> historyList = [
    HistoryModel(
      id: '1',
      type: 'Plasma',
      details: '600ml • O+',
      dateTime: '2024-08-15 at 11:00 AM',
      hospital: "Children's Hospital",
      status: 'Scheduled',
      isScheduled: true,
    ),
    HistoryModel(
      id: '2',
      type: 'Platelets',
      details: '2 units • O+',
      dateTime: '2024-02-20 at 2:00 PM',
      hospital: "St. Mary's Medical Center",
      pointsEarned: '+150 reward points earned',
      status: 'Completed',
      isScheduled: false,
    ),
    HistoryModel(
      id: '3',
      type: 'Whole Blood',
      details: '450ml • O+',
      dateTime: '2024-01-15 at 10:00 AM',
      hospital: "City General Hospital",
      pointsEarned: '+100 reward points earned',
      status: 'Completed',
      isScheduled: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donation History',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3142),
              ),
            ),
            SizedBox(height: 16.h),
            const HistoryStatsSection(),
            SizedBox(height: 24.h),
            ...historyList.map(
              (item) => HistoryCard(
                key: ValueKey(item.id),
                type: item.type,
                details: item.details,
                dateTime: item.dateTime,
                hospital: item.hospital,
                pointsEarned: item.pointsEarned,
                status: item.status,
                isScheduled: item.isScheduled,
                onReschedule: () => _onReschedule(context, item),
                onCancel: () => _showCancelDialog(context, item),
                onDelete: () => _showDeleteDialog(context, item),
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: TextButton(
                onPressed: () => _onDownloadHistory(context),
                child: Text(
                  'Download Complete History',
                  style: TextStyle(
                    color: AppColor.kSecondaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _onReschedule(BuildContext context, HistoryModel item) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Mock API call
        _showLoading(context, 'Saving new schedule...');
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context); // Close loading

        setState(() {
          final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          final formattedTime = pickedTime.format(context);
          item.dateTime = '$formattedDate at $formattedTime';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${item.type} donation rescheduled to ${item.dateTime}',
            ),
          ),
        );
      }
    }
  }

  void _showCancelDialog(BuildContext context, HistoryModel item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Donation'),
        content: Text(
          'Are you sure you want to cancel your ${item.type} donation?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              _showLoading(context, 'Cancelling donation...');
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pop(context); // Close loading

              setState(() {
                historyList.removeWhere((e) => e.id == item.id);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.type} donation has been cancelled.'),
                ),
              );
            },
            child: const Text(
              'Yes, Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, HistoryModel item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Record'),
        content: Text(
          'Delete this ${item.type} donation record from your history?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              _showLoading(context, 'Deleting record...');
              await Future.delayed(const Duration(milliseconds: 500));
              Navigator.pop(context); // Close loading

              setState(() {
                historyList.removeWhere((e) => e.id == item.id);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.type} record deleted.')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showLoading(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            SizedBox(width: 20.w),
            Text(message),
          ],
        ),
      ),
    );
  }

  void _onDownloadHistory(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('History PDF generated and downloading...')),
    );
  }
}
