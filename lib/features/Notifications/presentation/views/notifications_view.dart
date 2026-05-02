import 'package:blodbank/features/Notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fb),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f9fb),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF2D3142)),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            color: const Color(0xFF2D3142),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: Color(0xFF2D3142)),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: 7,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return NotificationItem(
            title: _getDummyTitle(index),
            time: _getDummyTime(index),
            isRead: index > 4,
          );
        },
      ),
    );
  }

  String _getDummyTitle(int index) {
    List<String> titles = [
      'Mona can donate type A blood.',
      'Jacob can donate blood type B+',
      'Eman needs blood from quarter A+',
      'Yaman can donate blood type O +',
      'Nour needs B+ blood',
      'Muhammad can donate blood type A+',
      'Mona can donate type A blood.',
    ];
    return titles[index % titles.length];
  }

  String _getDummyTime(int index) {
    List<String> times = [
      '2 min',
      '2 min',
      '1 min',
      'Yesterday',
      '2/02/2020',
      '1 min',
      'Yesterday',
    ];
    return times[index % times.length];
  }
}
