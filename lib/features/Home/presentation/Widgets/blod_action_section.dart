import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlodActionSection extends StatelessWidget {
  const BlodActionSection({
    super.key,
    required this.name,
    required this.imagePath,
    required this.onTap,
  });
  final String name;
  final String imagePath;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160.h,
        width: .43.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 12,
              right: 0,
              child: Image.asset(
                imagePath,
                width: 120.w,
                height: 100.h,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Text(
                name,

                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
