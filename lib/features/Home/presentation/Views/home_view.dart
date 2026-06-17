import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/features/Home/presentation/Widgets/blod_action_section.dart';
import 'package:blodbank/features/Home/presentation/Widgets/blood_type_card.dart';
import 'package:blodbank/features/Home/presentation/Widgets/donor_info_card.dart';
import 'package:blodbank/features/Home/presentation/Widgets/user_location_section.dart';
import 'package:blodbank/features/Home/presentation/Widgets/user_welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section (Avatar, Welcome message, Notification icon)
              const UserWelcomeSection(),
              SizedBox(height: 6.h),
              
              // Location Section
              const UserLocation(),
              SizedBox(height: 24.h),
              
              // Blood Type Card
              const BloodTypeCard(),
              
              // Quick Actions Section Header
              Text(
                'QUICK ACTIONS',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  letterSpacing: 0.6,
                ),
              ),
              SizedBox(height: 12.h),
              
              // Quick Actions Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlodActionSection(
                    name: 'Request Blood',
                    imagePath: 'Assets/images/request.png',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutesName.findDonors);
                    },
                  ),
                  BlodActionSection(
                    name: 'Donate Blood',
                    imagePath: 'Assets/images/donate.png',
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutesName.donateView);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              
              // More Features Section Header
              Text(
                'MORE FEATURES',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  letterSpacing: 0.6,
                ),
              ),
              SizedBox(height: 12.h),
              
              // More Features List Card
              const DonorInfoCard(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}