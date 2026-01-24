import 'package:blodbank/features/Donate/presentation/views/donate_view.dart';
import 'package:blodbank/features/NavigationBar/presentation/Cubits/navigation/navigation_cubit.dart';
import 'package:blodbank/features/NavigationBar/presentation/Views/navigation_bar.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/check_code.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/check_email.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/forget_password.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/new_password.dart';
import 'package:blodbank/features/auth/presentation/screens/initial_view.dart';
import 'package:blodbank/features/auth/presentation/screens/login_screen.dart';
import 'package:blodbank/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:blodbank/features/requestBlod/presentation/views/request_blod_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlodBannk());
}

class BlodBannk extends StatelessWidget {
  const BlodBannk({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          InitialView.id: (context) => InitialView(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          NewPassword.id: (context) => NewPassword(),
          ForgetPassword.id: (context) => ForgetPassword(),
          CheckEmail.id: (context) => CheckEmail(),
          CheckCode.id: (context) => CheckCode(),
          NavigationBBar.id: (context) => NavigationBBar(),
          DonateView.id: (context) => DonateView(),
          RequestBlodView.id: (context) => RequestBlodView(),
        },
        initialRoute: InitialView.id,
      ),
    );
  }
}
