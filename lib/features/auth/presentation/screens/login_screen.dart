import 'package:blodbank/features/auth/presentation/cubits/LogIn/log_in_cubit.dart';
import 'package:blodbank/features/auth/presentation/widgets/login_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String id = 'loginScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Log In', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: LoginInfoBody(),
      ),
    );
  }
}
