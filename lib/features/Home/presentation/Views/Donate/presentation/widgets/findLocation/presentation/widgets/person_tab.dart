import 'package:blodbank/features/Home/presentation/Views/Donate/presentation/widgets/findLocation/presentation/widgets/person_info_card.dart';
import 'package:flutter/material.dart';

class PersonTap extends StatelessWidget {
  const PersonTap({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 16),
            PersonInfoCard(),
            SizedBox(height: 16),
            PersonInfoCard(),
            SizedBox(height: 16),
            PersonInfoCard(),
            SizedBox(height: 16),
            PersonInfoCard(),
            SizedBox(height: 16),
            PersonInfoCard(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       height: 40.h,
          //       width: 140.w,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8.r),
          //         color: Colors.black.withValues(alpha: .88),
          //       ),
          //       child: Center(
          //         child: Text(
          //           '🔍    Find Donors',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       height: 40.h,
          //       width: 140.w,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         color: AppColor.kSecondaryColor,
          //       ),
          //       child: Center(
          //         child: Text(
          //           '+    New Request',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),