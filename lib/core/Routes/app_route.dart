import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/features/Home/presentation/Views/Donate/presentation/views/donate_view.dart';
import 'package:blodbank/features/Home/presentation/Views/Donate/presentation/widgets/findLocation/presentation/cubits/findHospital/find_hospita_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/Donate/presentation/widgets/findLocation/presentation/views/find_hospital_view.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/cubits/donorCubit/donor_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/views/find_donors_view.dart';
import 'package:blodbank/features/NavigationBar/presentation/Cubits/navigation/navigation_cubit.dart';
import 'package:blodbank/features/NavigationBar/presentation/Views/navigation_bar.dart';
import 'package:blodbank/features/Profile/presentation/Views/profile_view.dart';
import 'package:blodbank/features/auth/presentation/cubits/LogIn/log_in_cubit.dart';
import 'package:blodbank/features/auth/presentation/cubits/SignUp/sign_up_cubit.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/check_code.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/check_email.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/forget_password.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/new_password.dart';
import 'package:blodbank/features/auth/presentation/screens/initial_view.dart';
import 'package:blodbank/features/auth/presentation/screens/login_screen.dart';
import 'package:blodbank/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext)> routs = {
    AppRoutesName.initialView: (_) => InitialView(),
    AppRoutesName.checkCode: (_) => CheckCode(),
    AppRoutesName.logIn: (_) => BlocProvider(
      create: (context) => LogInCubit(),
      child: const LoginScreen(),
    ),
    AppRoutesName.signUp: (_) => BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpScreen(),
    ),
    AppRoutesName.newPassword: (_) => NewPassword(),
    AppRoutesName.forgetPassword: (_) => ForgetPassword(),
    AppRoutesName.checkEmail: (_) => CheckEmail(),
    AppRoutesName.donateView: (_) => DonateView(),
    AppRoutesName.navigationBBar: (_) => BlocProvider(
      create: (context) => NavigationCubit(),
      child: const NavigationBBar(),
    ),
    AppRoutesName.profileView: (_) => ProfileView(),
    AppRoutesName.findHospital: (_) => BlocProvider(
      create: (context) => FindHospitaCubit()..loadHospital(),
      child: FindHospitalView(),
    ),
    AppRoutesName.findDonors: (_) => BlocProvider(
      create: (context) => DonorCubit()..loadDonors(),
      child: FindDonorsView(),
    ),
  };
}
