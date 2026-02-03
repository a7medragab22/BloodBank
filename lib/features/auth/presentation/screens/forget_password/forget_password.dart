import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/features/auth/presentation/widgets/label.dart';
import 'package:flutter/material.dart';

import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "نسيت كلمة المرور",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: 20.h),
            Center(
              child: Image.asset(
                'Assets/images/forget_passsword.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
             SizedBox(height: 20.h),
            Label(
              preffixIcon: Icons.email_outlined,
              text: 'Email',
              hintText: 'example@gmail.com',
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 50.h),
            CustomButton(
              text: 'Send Code',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.checkCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
