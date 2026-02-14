import 'package:blodbank/core/ReusableCompounds/widgets/logo.dart';
import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/core/themes/app_color.dart';

import 'package:flutter/material.dart';

import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Logo()),
          SizedBox(height: 64.h),
          SizedBox(
            width: 250.w,
            child: Text(
              'Dramatically unleash cutting-edge vortals before maintainable platforms.',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.h),
          CustomButton(
            text: 'Sign Up',
            buttonColor: Colors.transparent,
            textColor: AppColor.kSecondaryColor,
            onPressed: () => Navigator.pushNamed(context, AppRoutesName.signUp),
          ),
          SizedBox(height: 12.h),
          CustomButton(
            text: 'Log In',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.logIn);
            },
          ),
        ],
      ),
    );
  }
}
