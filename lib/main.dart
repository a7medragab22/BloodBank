import 'package:blodbank/core/Routes/app_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const BlodBannk());
}

class BlodBannk extends StatelessWidget {
  const BlodBannk({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute.routs,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
  









    // routes: {
    //       InitialView.id: (context) => InitialView(),
    //       LoginScreen.id: (context) => LoginScreen(),
    //       SignUpScreen.id: (context) => SignUpScreen(),
    //       NewPassword.id: (context) => NewPassword(),
    //       ForgetPassword.id: (context) => ForgetPassword(),
    //       CheckEmail.id: (context) => CheckEmail(),
    //       CheckCode.id: (context) => CheckCode(),
    //       NavigationBBar.id: (context) => NavigationBBar(),
    //       DonateView.id: (context) => DonateView(),
    //       RequestBlodView.id: (context) => RequestBlodView(),
    //     },