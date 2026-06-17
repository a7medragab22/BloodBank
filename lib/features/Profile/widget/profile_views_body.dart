import 'package:blodbank/core/custom_Buttoms.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blodbank/features/Profile/widget/profile_info.dart';

class ProfileViewsBody extends StatelessWidget {
  const ProfileViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          const ProfileInfo(),
          // Helper to create info cards
          _infoCard(
            icon: Icons.email,
            title: 'Email',
            value: 'ajitteaches@gmail.com',
          ),
          _infoCard(
            icon: Icons.location_on,
            title: 'Address',
            value: '123 Main St, Bhubaneswar',
          ),
          _infoCard(
            icon: Icons.cake,
            title: 'Date of Birth',
            value: '5 Oct 1889',
          ),
          _infoCard(
            icon: Icons.bloodtype,
            title: 'Last Donated',
            value: '2 Feb 2022',
          ),
          _infoCard(
            icon: Icons.favorite,
            title: 'Total Units Donated',
            value: '0',
          ),
        ],
      ),
    );
  }

  Widget _infoCard({required IconData icon, required String title, required String value}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.kPrimaryColor.withOpacity(0.1),
          child: Icon(icon, color: AppColor.kPrimaryColor),
        ),
        title: Text(title, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500)),
        subtitle: Text(value, style: GoogleFonts.inter(fontSize: 14, color: Colors.black87)),
      ),
    );
  }
}