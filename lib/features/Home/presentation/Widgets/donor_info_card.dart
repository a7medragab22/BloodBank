import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonorInfoCard extends StatelessWidget {
  const DonorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Upload Reports Item
          _buildFeatureItem(
            context: context,
            icon: Icons.description_outlined,
            iconColor: Colors.blue[600]!,
            iconBgColor: Colors.blue[50]!,
            title: 'Upload Reports',
            subtitle: 'Share medical documents',
            onTap: () {
              Navigator.pushNamed(context, AppRoutesName.uploadReportView);
            },
          ),
          _buildDivider(),
          // Find Hospitals Item
          _buildFeatureItem(
            context: context,
            icon: Icons.insights_outlined, // ECG/pulse line representation
            iconColor: Colors.teal[600]!,
            iconBgColor: Colors.teal[50]!,
            title: 'Find Hospitals',
            subtitle: 'Nearby blood banks',
            onTap: () {
              Navigator.pushNamed(context, AppRoutesName.hospitals);
            },
          ),
          _buildDivider(),
          // AI Assistant Item
          _buildFeatureItem(
            context: context,
            icon: Icons.smart_toy_outlined,
            iconColor: Colors.deepPurple[600]!,
            iconBgColor: Colors.deepPurple[50]!,
            title: 'AI Assistant',
            subtitle: 'Ask anything about blood donation',
            showAIBadge: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('AI Assistant feature coming soon!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool showAIBadge = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: iconColor,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      if (showAIBadge) ...[
                        SizedBox(width: 6.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[50],
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'AI',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[100],
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
