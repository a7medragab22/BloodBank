
import 'package:blodbank/core/custom_Buttoms.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Row(
        children: [
          Text('Profile settings', style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.edit, color: AppColor.kPrimaryColor),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Edit profile coming soon')));
            },
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(color: AppColor.kPrimaryColor, height: 1),
      ),
    );
  }
}