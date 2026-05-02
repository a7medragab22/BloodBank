import 'package:blodbank/features/Rewards/presentation/widgets/how_to_earn_points.dart';
import 'package:blodbank/features/Rewards/presentation/widgets/points_summary_card.dart';
import 'package:blodbank/features/Rewards/presentation/widgets/reward_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Rewards & Points',
          style: TextStyle(
            color: const Color(0xFF2D3142),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xFF2D3142)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.wb_sunny_outlined, color: Color(0xFF2D3142)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF2D3142),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rewards & Points',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3142),
              ),
            ),
            SizedBox(height: 16.h),
            const PointsSummaryCard(),
            SizedBox(height: 24.h),
            const HowToEarnPoints(),
            SizedBox(height: 24.h),
            _buildTabs(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Rewards',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3142),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Text(
                    '750 points available',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF4B4F5A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            const RewardCard(
              title: 'Free Coffee',
              description: 'Complimentary coffee at partner cafes',
              partner: 'CafeLife',
              points: '50',
              icon: Icons.coffee,
            ),
            const RewardCard(
              title: 'Movie Ticket',
              description: 'Free movie ticket at partner cinemas',
              partner: 'CinemaMax',
              points: '200',
              icon: Icons.movie_outlined,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(child: _buildTabItem('Rewards', true)),
          Expanded(child: _buildTabItem('Achievements', false)),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive ? const Color(0xFF2D3142) : const Color(0xFF64748B),
        ),
      ),
    );
  }
}
